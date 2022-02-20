import 'package:flutfolio/src/models/contact_model.dart';
import 'package:flutfolio/src/widgets/contact_tile_widget.dart';
import 'package:flutfolio/src/widgets/header_widget.dart';
import 'package:flutfolio/utils/icon_helper.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  final ContactModel contact;
  const ContactPage({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderWidget(title: 'CONTATO'),
        Expanded(
          child: ListView(
            children: [
              ContactTileWidget(iconUrl: IconHelper.getPath(IconName.person), textLines: [
                contact.name,
                '${contact.birthDate.day}/${contact.birthDate.month}/${contact.birthDate.year}'
              ]),
              ContactTileWidget(iconUrl: IconHelper.getPath(IconName.marker), textLines: [contact.city, contact.state]),
              ContactTileWidget(iconUrl: IconHelper.getPath(IconName.whatsapp), textLines: [contact.number]),
              ContactTileWidget(iconUrl: IconHelper.getPath(IconName.github), textLines: [contact.githubUrl]),
              ContactTileWidget(iconUrl: IconHelper.getPath(IconName.linkedin), textLines: [contact.linkedinUrl]),
            ],
          ),
        ),
      ],
    );
  }
}
