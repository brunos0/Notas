import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:gap/gap.dart';
import 'package:provaflutter/models/form_error.dart';
import '../models/login_validation.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final Icon? icon;
  final double size;
  final String hint;
  final bool obscureText;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final FormError formError;

  const CustomInputField(this.label, this.icon, this.size, this.hint,
      this.obscureText, this.controller, this.formKey, this.formError,
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
            child: SizedBox(
              width: size,
              child: TextFormField(
                onTap: () => {formError.clearError(label)},
                onChanged: (_) => {formError.clearError(label)},
                maxLength: 20,
                onSaved: (data) => validator.saveData(label, data ?? ""),
                validator: (_) =>
                    validator.validField(controller.text, formError, label),
                obscureText: obscureText,
                textAlign: TextAlign.center,
                controller: controller,
                decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: const TextStyle(
                        color: Colors.black87,
                        fontFamily:
                            'Dalle_bold', //trocar a fonte por uma mais grossa
                        letterSpacing: 0.50,
                        fontWeight: FontWeight.bold),
                    //isDense: true,
                    contentPadding:
                        icon != null ? null : const EdgeInsets.all(2),
                    counterText: "",
                    filled: true,
                    errorStyle: const TextStyle(fontSize: 0.01),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: icon,
                    prefixIconColor: Colors.black),
              ),
            )),
        const Gap(20),
      ],
    );
  }
}
