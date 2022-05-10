import 'package:flutter/cupertino.dart';
import 'package:wepsys_contact_list/features/add_contact/view/pages/add_contact_page/add_contact_page.dart';
import 'package:wepsys_contact_list/features/core/models/contact/contact.dart';

class ContactListPageViewModel extends ChangeNotifier {
  final List<Contact> contacts = [];

  void add(BuildContext context) async {
    final newContact =
        await Navigator.of(context).pushNamed(AddContactPage.route) as Contact?;

    if (newContact == null) {
      return;
    }

    contacts.add(newContact);
    notifyListeners();
  }

  void edit(BuildContext context, Contact pContact) async {
    final newContact = await Navigator.of(context).pushNamed(
      AddContactPage.route,
      arguments: AddContactPageArguments(pContact),
    ) as Contact?;

    if (newContact == null) {
      return;
    }

    final index = contacts.indexWhere(
      (contact) => contact.phone == pContact.phone,
    );
    contacts[index] = newContact;
    notifyListeners();
  }
}
