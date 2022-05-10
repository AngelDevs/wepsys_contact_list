import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wepsys_contact_list/features/core/models/contact/contact.dart';
import 'package:wepsys_contact_list/features/core/utils/forms/input_formatters/input_formatters.dart';

class AddContactPageViewModel extends ChangeNotifier {
  Contact? contact;

  late final GlobalKey<FormState> contactFormKey;

  late TextEditingController nameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneController;

  void init(pContact) {
    contactFormKey = GlobalKey<FormState>();
    contact = pContact;
    nameController = TextEditingController(text: contact?.name);
    lastNameController = TextEditingController(text: contact?.lastName);
    phoneController = TextEditingController(text: contact?.phone);
  }

  void save(BuildContext context) {
    String phoneValue = _formatNumberOnSave();

    if (!contactFormKey.currentState!.validate()) {
      return;
    }

    Navigator.of(context).pop(
      Contact(
        name: nameController.text,
        lastName: lastNameController.text,
        phone: phoneValue,
      ),
    );
  }

  String _formatNumberOnSave() {
    String phoneValue = phoneController.text;
    if (phoneController.text.length < 12) {
      phoneValue = phoneController.text.replaceAll('-', '');
    }

    return phoneValue;
  }

  void formatNumberOnChange(String? value) {
    phoneFormatter(value ?? '');
  }

  void clean() {
    nameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
  }
}
