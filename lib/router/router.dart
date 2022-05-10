import 'package:flutter/material.dart';
import 'package:wepsys_contact_list/features/add_contact/routes/routes.dart';
import 'package:wepsys_contact_list/features/contacts_list/routes/routes.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  ...contactListFeatureRoutes,
  ...addContactFeatureRoutes,
};
