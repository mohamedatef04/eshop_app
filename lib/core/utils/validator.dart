import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class Validator {
  static String? validateEmptyText(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).field_required;
    }

    return null;
  }

  static String? validateName(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).field_required;
    } else if (value.length < 3) {
      return S.of(context).invalid_name;
    } else if (value.length > 50) {
      return S.of(context).invalid_name;
    }

    return null;
  }

  static String? validateEmail(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).email_required;
    }
    final emailRegExp = RegExp(
      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
    );

    if (!emailRegExp.hasMatch(value)) {
      return S.of(context).invalid_email;
    }

    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).password_required;
    }

    if (value.length < 8) {
      return S.of(context).password_too_short;
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return S.of(context).password_complexity_uppercase;
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return S.of(context).password_complexity_lowercase;
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return S.of(context).password_complexity_number;
    }
    if (!value.contains(RegExp(r'^(?=.*?[#?!@$%^&*-])'))) {
      return S.of(context).password_complexity_special;
    }
    return null;
  }

  static String? validatePhone(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).phone_required;
    }
    final phoneRegExp = RegExp(r'^(010|011|012|015)[0-9]{8}$');

    if (!phoneRegExp.hasMatch(value)) {
      return S.of(context).invalid_phone;
    }
    return null;
  }

  static String? validateConfirmPassword(
    BuildContext context,
    String? value,
    String password,
  ) {
    if (value == null || value.isEmpty) {
      return S.of(context).confirm_password_required;
    }
    if (value != password) {
      return S.of(context).passwords_dont_match;
    }
    return null;
  }
}
