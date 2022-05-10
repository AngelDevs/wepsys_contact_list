import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wepsys_contact_list/features/add_contact/view/widgets/contact_form/contact_form.dart';
import 'package:wepsys_contact_list/features/add_contact/view_models/add_contact_page_view_model/add_contact_page_view_model.dart';
import 'package:wepsys_contact_list/features/core/models/contact/contact.dart';
import 'package:wepsys_contact_list/features/core/views/widgets/appbar_trailing_button/appbar_trailing_button.dart';

class AddContactPage extends StatefulWidget {
  static const String route = '/new_contact';
  final Contact? contact;

  const AddContactPage({
    this.contact,
    Key? key,
  }) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  @override
  void initState() {
    super.initState();
    context.read<AddContactPageViewModel>().init(widget.contact);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AddContactPageViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Contact'),
              centerTitle: true,
              actions: [
                AppBarTrailingButton(
                  onPressed: () => value.save(context),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ContactForm(
                formKey: value.contactFormKey,
                nameController: value.nameController,
                lastNameController: value.lastNameController,
                phoneController: value.phoneController,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => value.save(context),
              child: const Icon(
                Icons.save,
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddContactPageArguments {
  final Contact? contact;

  AddContactPageArguments(this.contact);
}
