import 'package:flutter/material.dart';
import 'package:stock_mate/generated/l10n.dart';

String? passwordVerificationMethod(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return S.of(context).fieldRequired;
  }
  if (value.length < 6) {
    return S.of(context).invalidPassword;
  }

  return null;
}

String? emailVerificationMethod(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return S.of(context).fieldRequired;
  }
  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) {
    return S.of(context).invalidEmail;
  }
  return null;
}
  String? fieldRequiredVerification(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).fieldRequired;
    }
    return null;
  }