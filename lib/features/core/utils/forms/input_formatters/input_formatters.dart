import 'package:flutter/services.dart';

final onlyNumbersInputFormater = [
  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
];

String phoneFormatter(String value) {
  List<String> chars = value.split('');
  // if char is in position 4 or 8 and the char is dash
  final isCharOnDashPositionADash =
      (chars.length == 4 || chars.length == 8) && chars.last == '-';

  // if chars length is greater than 10 then formatting does not apply
  final isPhoneFormatCustom = chars.length > 10;

  // if chars length is greater than 3 and in position 4 (chars[3]) and char is no dash
  final hasToInsertFirstDash = chars.length > 3 && chars[3] != '-';

  // if chars length is greater than 6 and in position 7 (chars[6]) and char is no dash
  final hasToInsertSecondDash = chars.length > 6 && chars[6] != '-';

  if (isCharOnDashPositionADash) {
    chars.removeLast();
  }

  if (hasToInsertFirstDash) {
    chars.insert(3, '-');
  }

  if (hasToInsertSecondDash) {
    chars.insert(7, '-');
  }

  if (isPhoneFormatCustom) {
    chars.removeWhere((char) => char == '-');
  }

  return chars.join();
}
