import 'package:flutter/material.dart';
import 'package:wepsys_contact_list/features/contacts_list/routes/routes.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  ...contactListFeatureRoutes,
};