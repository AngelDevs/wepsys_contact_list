import 'package:flutter/material.dart';
import 'package:wepsys_contact_list/features/core/models/contact/contact.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts;
  final Function(Contact contact) onTap;

  const ContactList({
    required this.contacts,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          onTap: () => onTap(contact),
          title: Text(
            '${contact.name} ${contact.lastName}',
          ),
          subtitle: Text(contact.phone),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
          ),
        );
      },
    );
  }
}
