import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notes.g.dart';

class Notes = ANotes with _$Notes;

abstract class ANotes with Store {
  @observable
  ObservableList<String> notes = ObservableList.of([]);

  @observable
  bool isEdit = false;

  @observable
  String editedString = "";

  @action
  Future<void> remove(int index, BuildContext context) async {
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
              child: const Text('Não'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
    if (result == true) {
      notes.removeAt(index);
    }
  }

  @action
  Future<void> edit(
      int index, BuildContext context, TextEditingController controller) async {
    bool? result = true;

    if (controller.text.isNotEmpty) {
      result = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Descartar texto?'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Deseja realmente descartar o texto digitado?'),
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
                child: const Text('Não'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          );
        },
      );
    }

    if (result == true) {
      controller.text = notes[index];
      editedString = controller.text;
      isEdit = true;
    }
  }

  @action
  Future<void> save(
      BuildContext context, TextEditingController controller) async {
    bool? result = true;

    if (notes.contains(controller.text) && !isEdit) {
      result = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Texto já existe na lista.'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Informe outro valor para salvar.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              )
            ],
          );
        },
      );
    }
    if (result == false) return;
    if (result == true && !isEdit) {
      notes.add(controller.text);
      controller.text = "";
    } else if (result == true && isEdit) {
      if (controller.text != editedString) {
        int index = notes.indexOf(editedString);
        notes[index] = controller.text;
      }
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('notes', notes);
    isEdit = false;
    controller.text = "";
  }

  @action
  Future loadList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('notes') == null) {
      await prefs.setStringList('notes', <String>[]);
    }
    // await prefs.setStringList('notes', ["Bruno", "Cesar", "Horvat"]);
    notes.clear();
    notes.addAll(prefs.getStringList('notes')!);
  }
}
