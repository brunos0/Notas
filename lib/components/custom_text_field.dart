import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:provaflutter/models/form_error.dart';
import '../models/login_validation.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Icon icon;
  final bool obscureText;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final FormError formError;

  const CustomTextField(this.label, this.icon, this.obscureText,
      this.controller, this.formKey, this.formError,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final validator = LoginValidation();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Dalle_light',
              letterSpacing: 1.00,
            ),
          ),
        ),
        const Gap(5),
        Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(66.0),
            child: TextFormField(
              onTap: () => {formError.clearError(label)},
              maxLength: 20,
              onSaved: (data) => validator.saveData(label, data ?? ""),
              validator: (_) =>
                  validator.validField(controller.text, formError, label),
              //inputFormatters: [],
              obscureText: obscureText,
              textAlign: TextAlign.left,
              controller: controller,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(2),
                  counterText: "",
                  filled: true,
                  errorStyle: const TextStyle(fontSize: 0.01),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: icon,
                  prefixIconColor: Colors.black),
            )),
        Observer(
            builder: (_) => Visibility(
                visible: formError.fields[label]!, //.fields[label]!,
                child: const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Por favor, use apenas letras ou números.",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ))),
        const Gap(20),
      ],
    );
  }
}
