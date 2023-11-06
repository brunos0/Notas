import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:mobx/mobx.dart';
import 'package:provaflutter/components/custom_input_field.dart';
import 'package:provaflutter/components/list_card.dart';

import 'package:provaflutter/models/form_error.dart';
import 'package:provaflutter/models/notes.dart';
import 'package:provaflutter/utils/app_routes.dart';
import 'package:provaflutter/utils/curved_clipper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesPage extends StatefulWidget {
  NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final TextEditingController _userController = TextEditingController();

  //final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //final LoginValidation _validator = LoginValidation();
  final bool _obscureText = false;

  final FormError formError = FormError();

  final double _size = 300;
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  final Notes notes = Notes();

  void edit(int index) {}

  /*
  void remove(int index) {
    print("entrou aqui");
    AlertDialog(
      title: const Text('Deseja excluir registro?'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Deseja realmente excluir a anotação?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Sim'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        TextButton(
          child: const Text('Sim'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
  */
  void openPolicy() {
    Navigator.of(context).pushNamed(AppRoutes.policyTerms);
  }

  @override
  Widget build(BuildContext context) {
    notes.loadList();
    return MaterialApp(
      title: 'Prova Flutter - Bruno Horvat',
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(27, 78, 98, 1),
                    Color.fromRGBO(47, 146, 138, 1),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipPath(
                      clipper: CurveClipper(),
                      child: Container(
                        color: Colors.white,
                        width: 300,
                        height: 350,
                        child: notes.listEmpty()
                            ? null
                            : Observer(
                                builder: (_) => ListView.builder(
                                  itemCount: notes.listSize(),
                                  itemBuilder: (BuildContext ctx, int index) {
                                    return ListCard(
                                      notes.toList(),
                                      index,
                                      edit,
                                      (index, context) =>
                                          notes.remove(index, context),
                                    );
                                  },
                                ),
                              ),
                      ),
                    ),
                    const Gap(20),
                    Form(
                      key: _formKey,
                      child: CustomInputField(
                        "",
                        null, //const Icon(Icons.person)
                        _size,
                        "Digite seu texto",
                        _obscureText,
                        _userController,
                        _formKey,
                        formError,
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
      ),
    );
  }
}
