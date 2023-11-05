import 'package:flutter/material.dart';
import 'package:provaflutter/models/form_error.dart';
import 'package:provaflutter/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginValidation {
  final regex = RegExp(r'^[a-zA-Z0-9]+$');

  validField(String data, FormError formError, String label) {
    if (!regex.hasMatch(data) || data.length < 2) {
      formError.errorHappend(label);
      return 'Erro';
    }
    return null;
  }

  submmit(GlobalKey<FormState> formKey, context) {
    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    formKey.currentState?.save();
    Navigator.of(context).pushNamed(AppRoutes.notesPage);
  }

  saveData(String label, String data) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(label, data);
  }
}
