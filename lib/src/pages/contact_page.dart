import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutfolio/src/models/contact_model.dart';
import 'package:flutfolio/src/stores/auth_store.dart';
import 'package:flutfolio/src/stores/contact_store.dart';
import 'package:flutfolio/src/utils/generic_show_dialog.dart';
import 'package:flutfolio/src/utils/icon_helper.dart';
import 'package:flutfolio/src/widgets/card_generic_widget.dart';
import 'package:flutfolio/src/widgets/contact_tile_widget.dart';
import 'package:flutfolio/src/widgets/generic_action_icon.widget.dart';
import 'package:flutfolio/src/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ContactPage extends StatefulWidget {
  final ContactModel contact;
  const ContactPage({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final authStore = GetIt.I<AuthStore>();
  final contactStore = GetIt.I<ContactStore>();

  @override
  void initState() {
    super.initState();
    contactStore.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderWidget(title: 'CONTATO'),
            authStore.isAuthenticate
                ? Row(
                    children: [
                      CardGenericWidget(
                        child: IconButton(
                          onPressed: () {
                            authStore.logout();
                            Navigator.of(context).pushReplacementNamed('/');
                          },
                          icon: const Icon(Icons.keyboard_return),
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
        FutureBuilder<QuerySnapshot<Object?>>(
          future: contactStore.getContactDefaultUser(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData &&
                snapshot.data!.docs.isNotEmpty) {
              List<ContactModel> contacts = snapshot.data!.docs.map((element) {
                return ContactModel.fromMap(element.data() as Map<String, dynamic>);
              }).toList();

              return Expanded(
                child: ListView(
                  children: [
                    ContactTileWidget(iconUrl: IconHelper.getPath(IconName.person), textLines: [
                      contacts.first.name,
                      // '${contacts.first.birthDate.day}/${contacts.first.birthDate.month}/${contacts.first.birthDate.year}'
                    ]),
                    ContactTileWidget(
                      iconUrl: IconHelper.getPath(IconName.marker),
                      textLines: [contacts.first.city, contacts.first.state],
                    ),
                    ContactTileWidget(
                      iconUrl: IconHelper.getPath(IconName.whatsapp),
                      textLines: [contacts.first.number],
                    ),
                    ContactTileWidget(
                      iconUrl: IconHelper.getPath(IconName.github),
                      textLines: [contacts.first.githubUrl],
                    ),
                    ContactTileWidget(
                      iconUrl: IconHelper.getPath(IconName.linkedin),
                      textLines: [contacts.first.linkedinUrl],
                    ),
                    authStore.isAuthenticate
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GenericActionIconWidget(
                                iconData: Icons.delete,
                                onPressed: () {
                                  GenericShowDialog.showGenericFormDialog(
                                    context,
                                    isRemove: true,
                                    onAction: () async {
                                      await contactStore.removeByDodRef(contacts.first.docRef);
                                    },
                                  );
                                },
                              ),
                              const SizedBox(width: 30),
                              GenericActionIconWidget(
                                iconData: Icons.edit,
                                onPressed: () {
                                  GenericShowDialog.showGenericFormDialog(
                                    context,
                                    isEdit: true,
                                    docRef: contacts.first.docRef,
                                    onAction: () async {
                                      contactStore.onDialogEdit(docRef: contacts.first.docRef);
                                    },
                                  );
                                },
                              )
                            ],
                          )
                        : Container(),
                  ],
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData &&
                snapshot.data!.docs.isEmpty) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Não há dados para serem exbidos',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    GenericActionIconWidget(
                      iconData: Icons.add,
                      onPressed: () {
                        contactStore.clear();
                        GenericShowDialog.showGenericFormDialog(
                          context,
                          onAction: () async {
                            if (contactStore.contactFormKey.currentState!.validate()) {
                              await contactStore.addContact();
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }
}
