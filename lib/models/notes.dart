import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notes.g.dart';

class Notes = ANotes with _$Notes;

abstract class ANotes with Store {
  @observable
  ObservableList<String> _notes = ObservableList();

  @action
  bool listEmpty() {
    return _notes.isEmpty;
  }

  @action
  int listSize() {
    return _notes.length;
  }

  @action
  List<String> toList() {
    return _notes.toList();
  }

  @action
  Future<void> remove(int index, BuildContext context) async {
    print("entrou aqui");
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
                child: const Text('Sim'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          );
        });
    if (result == true) {
      print("verdade");
      // Realize a ação aqui se o usuário clicar em 'Sim'
    } else {
      print("mentira");
      // Realize a ação aqui se o usuário clicar em 'Não' ou fechar o diálogo
    }
  }

  @action
  Future loadList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('notes') == null) {
      await prefs.setStringList('notes', <String>[]);
    }
    await prefs.setStringList('notes', ["Bruno"]);
    _notes.addAll(prefs
        .getStringList('notes')!
        .toList()); //= prefs.getStringList('notes')!;
  }
}
