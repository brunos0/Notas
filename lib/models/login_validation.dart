import 'package:flutter/material.dart';
import 'package:provaflutter/models/form_error.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginValidation {
  final regex = RegExp(r'^[a-zA-Z0-9]+$');

  validField(String data, FormError formError, String label) {
    if (!regex.hasMatch(data)) {
      formError.errorHappend(label);
      return 'Por favor, use apenas letras.';
    }
    return null;
  }

  submmit(GlobalKey<FormState> formKey) {
    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    /*
    setState(() {
      _isLoading = true;
    });
    */
    formKey.currentState?.save();

    //Auth auth = Provider.of(context, listen: false);

    /*
    try {
      if (_isLogin()) {
        await auth.login(
          _autData["email"]!,
          _autData["password"]!,
        );
      } else {
        await auth.signup(
          _autData["email"]!,
          _autData["password"]!,
        );
      }
    } on AuthException catch (error) {
      _showErroDialog(error.toString());
    } catch (error) {
      _showErroDialog("Ocorreu um erro inesperado.");
    }

    setState(() {
      _isLoading = false;
    });
 
*/
  }

  saveData(String label, String data) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(label, data);
  }
}
