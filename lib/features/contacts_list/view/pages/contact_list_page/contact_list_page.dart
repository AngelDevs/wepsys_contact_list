import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wepsys_contact_list/features/contacts_list/view_models/contact_list_page_view_model/contact_list_page_view_model.dart';

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
            body: ListView.builder(
              itemCount: value.contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  onTap: () => value.edit(context, contact),
                  title: Text(
                    '${contact.name} ${contact.lastName}',
                  ),
                  subtitle: Text(contact.phone),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                );
              },
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
}
