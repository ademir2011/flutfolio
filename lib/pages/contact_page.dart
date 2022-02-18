import 'package:flutfolio/components/ccontact_tile.dart';
import 'package:flutfolio/components/cheader.dart';
import 'package:flutfolio/models/contact.dart';
import 'package:flutfolio/utils/icon_helper.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  final Contact contact;
  const ContactPage({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CHeader(title: 'CONTATO'),
        Expanded(
          child: ListView(
            children: [
              CContactTile(iconUrl: IconHelper.getPath(IconName.person), textLines: [
                contact.name,
                '${contact.birthDate.day}/${contact.birthDate.month}/${contact.birthDate.year}'
              ]),
              CContactTile(iconUrl: IconHelper.getPath(IconName.marker), textLines: [contact.city, contact.state]),
              CContactTile(iconUrl: IconHelper.getPath(IconName.whatsapp), textLines: [contact.number]),
              CContactTile(iconUrl: IconHelper.getPath(IconName.github), textLines: [contact.githubUrl]),
              CContactTile(iconUrl: IconHelper.getPath(IconName.linkedin), textLines: [contact.linkedinUrl]),
            ],
          ),
        ),
      ],
    );
  }
}
