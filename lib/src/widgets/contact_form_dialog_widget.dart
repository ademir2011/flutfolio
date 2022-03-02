import 'package:flutfolio/src/widgets/textinput_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutfolio/src/stores/contact_store.dart';
import 'package:get_it/get_it.dart';

class ContactFormDialogWidget extends StatefulWidget {
  const ContactFormDialogWidget({
    Key? key,
    required this.context,
    required this.docRef,
    required this.isEdit,
    required this.onPressed,
  }) : super(key: key);

  final BuildContext context;
  final bool isEdit;
  final String? docRef;
  final Future Function() onPressed;

  @override
  State<ContactFormDialogWidget> createState() => _ContactFormDialogWidgetState();
}

class _ContactFormDialogWidgetState extends State<ContactFormDialogWidget> {
  final contactStore = GetIt.I<ContactStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isEdit && widget.docRef != null) {
      contactStore.initFields(widget.docRef!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor,
      title: Text(widget.isEdit ? 'Editar contatos' : 'Cadastrar contatos'),
      content: SingleChildScrollView(
        child: Form(
          key: contactStore.contactFormKey,
          child: SizedBox(
            width: 400,
            child: Column(
              children: [
                TextFormInputWidget(
                  controller: contactStore.nameController,
                  hintText: 'Nome completo',
                  validator: contactStore.nameValidate,
                ),
                const SizedBox(height: 10),
                TextFormInputWidget(
                  controller: contactStore.birthDateController,
                  hintText: 'Data de Nascimento',
                  validator: contactStore.nameValidate,
                ),
                const SizedBox(height: 10),
                TextFormInputWidget(
                  controller: contactStore.cityController,
                  hintText: 'Cidade',
                  validator: contactStore.nameValidate,
                ),
                const SizedBox(height: 10),
                TextFormInputWidget(
                  controller: contactStore.stateController,
                  hintText: 'Estado',
                  validator: contactStore.nameValidate,
                ),
                const SizedBox(height: 10),
                TextFormInputWidget(
                  controller: contactStore.phoneController,
                  hintText: 'Celular',
                  validator: contactStore.nameValidate,
                ),
                const SizedBox(height: 10),
                TextFormInputWidget(
                  controller: contactStore.githubLinkController,
                  hintText: 'link github',
                  validator: contactStore.nameValidate,
                ),
                const SizedBox(height: 10),
                TextFormInputWidget(
                  controller: contactStore.linkedinController,
                  hintText: 'link linkedin',
                  validator: contactStore.nameValidate,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Text(
              'Fechar',
              style: TextStyle(
                color: Theme.of(context).errorColor,
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Text(
              widget.isEdit ? 'Atualizar' : 'Cadastrar',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          onPressed: () async {
            await widget.onPressed();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
