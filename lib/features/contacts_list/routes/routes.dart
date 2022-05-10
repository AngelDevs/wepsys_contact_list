import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wepsys_contact_list/features/contacts_list/view/pages/contact_list_page/contact_list_page.dart';
import 'package:wepsys_contact_list/features/contacts_list/view_models/contact_list_page_view_model/contact_list_page_view_model.dart';

final contactListFeatureRoutes = {
  ContactListPage.route: (BuildContext context) =>
      ChangeNotifierProvider<ContactListPageViewModel>(
        create: (context) => ContactListPageViewModel(),
        child: const ContactListPage(),
      ),
};
