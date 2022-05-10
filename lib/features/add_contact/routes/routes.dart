import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wepsys_contact_list/features/add_contact/view/pages/add_contact_page/add_contact_page.dart';
import 'package:wepsys_contact_list/features/add_contact/view_models/add_contact_page_view_model/add_contact_page_view_model.dart';

final addContactFeatureRoutes = {
  AddContactPage.route: (BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as AddContactPageArguments?;

    return ChangeNotifierProvider<AddContactPageViewModel>(
      create: (context) => AddContactPageViewModel(),
      child: AddContactPage(contact: args?.contact),
    );
  }
};
