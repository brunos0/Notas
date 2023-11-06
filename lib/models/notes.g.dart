// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Notes on ANotes, Store {
  late final _$_notesAtom = Atom(name: 'ANotes._notes', context: context);

  @override
  ObservableList<String> get _notes {
    _$_notesAtom.reportRead();
    return super._notes;
  }

  @override
  set _notes(ObservableList<String> value) {
    _$_notesAtom.reportWrite(value, super._notes, () {
      super._notes = value;
    });
  }

  late final _$removeAsyncAction =
      AsyncAction('ANotes.remove', context: context);

  @override
  Future<void> remove(int index, BuildContext context) {
    return _$removeAsyncAction.run(() => super.remove(index, context));
  }

  late final _$loadListAsyncAction =
      AsyncAction('ANotes.loadList', context: context);

  @override
  Future<dynamic> loadList() {
    return _$loadListAsyncAction.run(() => super.loadList());
  }

  late final _$ANotesActionController =
      ActionController(name: 'ANotes', context: context);

  @override
  bool listEmpty() {
    final _$actionInfo =
        _$ANotesActionController.startAction(name: 'ANotes.listEmpty');
    try {
      return super.listEmpty();
    } finally {
      _$ANotesActionController.endAction(_$actionInfo);
    }
  }

  @override
  int listSize() {
    final _$actionInfo =
        _$ANotesActionController.startAction(name: 'ANotes.listSize');
    try {
      return super.listSize();
    } finally {
      _$ANotesActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<String> toList() {
    final _$actionInfo =
        _$ANotesActionController.startAction(name: 'ANotes.toList');
    try {
      return super.toList();
    } finally {
      _$ANotesActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
