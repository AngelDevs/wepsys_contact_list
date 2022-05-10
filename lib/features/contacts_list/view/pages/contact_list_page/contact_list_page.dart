import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wepsys_contact_list/features/contacts_list/view/widgets/contact_list/contact_list.dart';
import 'package:wepsys_contact_list/features/contacts_list/view_models/contact_list_page_view_model/contact_list_page_view_model.dart';
import 'package:wepsys_contact_list/features/core/models/contact/contact.dart';

class ContactListPage extends StatelessWidget {
  static const String route = '/';

  const ContactListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ContactListPageViewModel>(
        builder: (context, value, child) {
          final contacts = value.contacts;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Contacts'),
            ),
            body: _buildBody(
              context,
              contacts,
              (contact) => value.edit(
                context,
                contact,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => value.add(context),
              child: const Icon(
                Icons.add,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    List<Contact> contacts,
    Function(Contact) onTap,
  ) {
    if (contacts.isEmpty) {
      return const Center(
        child: Text('Contact list is empty'),
      );
    }

    return ContactList(
      contacts: contacts,
      onTap: (contact) => onTap(contact),
    );
  }
}
