import 'package:flutter/foundation.dart';

@immutable
class Contact {
  final String name;
  final String? lastName;
  final String phone;

  const Contact({
    required this.name,
    required this.lastName,
    required this.phone,
  });
}
