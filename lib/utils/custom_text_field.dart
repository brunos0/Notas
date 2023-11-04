import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Icon icon;
  final TextEditingController controller;

  const CustomTextField(this.label, this.icon, this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
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
            //textAlign: TextAlign.left
          ),
        ),
        const Gap(5),
        Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(66.0),
            child: TextField(
              maxLength: 20,
              //inputFormatters: [],
              textAlign: TextAlign.left,
              controller: controller,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(2),
                  counterText: "",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: icon,
                  prefixIconColor: Colors.black

                  //hintText: 'flutter'
                  ),
            )),
        const Gap(20),
      ],
    );
  }
}
