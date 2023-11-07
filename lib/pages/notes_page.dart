import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:provaflutter/components/custom_input_field.dart';
import 'package:provaflutter/components/list_card.dart';
import 'package:provaflutter/models/notes.dart';
import 'package:provaflutter/utils/app_routes.dart';
import 'package:provaflutter/utils/curved_clipper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class NotesPage extends StatefulWidget {
  NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final TextEditingController _userController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool _obscureText = false;
  final double _size = 300;
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final _inputFocus = FocusNode();
  final Uri uri =
      Uri(scheme: 'https', host: 'www.google.com' /*, path: 'headers/'*/);

  final Notes notes = Notes();

  void openPolicy() {
    Navigator.of(context).pushNamed(AppRoutes.policyTerms);
  }

  @override
  void initState() {
    super.initState();
    notes.loadList();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _inputFocus.requestFocus());
  }

  @override
  void dispose() {
    super.dispose();
    _inputFocus.dispose();
    _userController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        title: 'Prova Flutter - Bruno Horvat',
        home: Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onTap: () {
                _inputFocus.requestFocus();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(27, 78, 98, 1),
                            Color.fromRGBO(47, 146, 138, 1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
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
                            child: notes.notes.isEmpty
                                ? null
                                : Observer(
                                    builder: (_) => ListView.builder(
                                      itemCount: notes.notes.length,
                                      itemBuilder:
                                          (BuildContext ctx, int index) {
                                        return Observer(
                                          builder: (_) => ListCard(
                                            notes.notes,
                                            index,
                                            _userController,
                                            (index, context, controller) =>
                                                notes.edit(
                                                    index, context, controller),
                                            (index, context) =>
                                                notes.remove(index, context),
                                          ),
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
                            null,
                            _size,
                            "Digite seu texto",
                            _obscureText,
                            _userController,
                            _inputFocus,
                            _formKey,
                            (context, controller) =>
                                notes.save(context, controller),
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
                        onPressed: () async {
                          //openPolicy();
                          await launchUrl(uri, mode: LaunchMode.inAppWebView);
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
        ),
      ),
    );
  }
}
