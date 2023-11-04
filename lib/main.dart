import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provaflutter/pages/policy_terms.dart';
import 'package:provaflutter/utils/app_routes.dart';
import 'package:provaflutter/components/custom_text_field.dart';
import './models/login_validation.dart';

import 'package:mobx/mobx.dart';
import 'models/form_error.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prova Flutter - Bruno Horvat',
      home: const MyHomePage(title: 'Prova Flutter'),
      routes: {
        AppRoutes.policyTerms: (ctx) => const PolicyTerms(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginValidation _validator = LoginValidation();
  final bool _obscureText = true;
  final FormError formError = FormError();

  void openPolicy() {
    Navigator.of(context).pushNamed(AppRoutes.policyTerms);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField("Usuário", const Icon(Icons.person),
                        _obscureText, _userController, _formKey, formError),
                    CustomTextField("Senha", const Icon(Icons.lock),
                        _obscureText, _passwordController, _formKey, formError),
                    const Gap(10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(68, 189, 110, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.fromLTRB(60, 15, 60, 15),
                      ),
                      onPressed: () {
                        _validator.submmit(_formKey);
                      },
                      child: const Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 1.00,
                        ),
                      ),
                    ),
                  ],
                ),
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
    );
  }
}
