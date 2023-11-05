import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provaflutter/components/custom_input_field.dart';
import 'package:provaflutter/components/custom_text_field.dart';
import 'package:provaflutter/models/form_error.dart';
import 'package:provaflutter/utils/curved_clipper.dart';

class NotesPage extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();
  //final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //final LoginValidation _validator = LoginValidation();
  final bool _obscureText = false;
  final FormError formError = FormError();
  final double _size = 300;

  //final List listNotes = [];
  final List listNotes = ["nome"];

  NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Prova Flutter - Bruno Horvat',
        home: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(27, 78, 98, 1),
                      Color.fromRGBO(47, 146, 138, 1),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                ),
                //
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipPath(
                        clipper: CurveClipper(),
                        child: Container(
                            color: Colors.white,
                            width: 300,
                            height: 350,
                            child: ListView.builder(
                                itemCount: listNotes.length,
                                itemBuilder: (BuildContext ctx, int index) {
                                  return ListTile(
                                      title: Text(listNotes[index]));
                                })),
                      ),
                      const Gap(20),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomInputField(
                              "",
                              null, //const Icon(Icons.person)
                              _size,
                              "Digite seu texto",
                              _obscureText,
                              _userController,
                              _formKey,
                              formError,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {
                        openPolicy();
                      },
                      child: const Text(
                        "Política de Privacidade",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Dalle_light',
                          letterSpacing: 1.00,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void openPolicy() {}
}
