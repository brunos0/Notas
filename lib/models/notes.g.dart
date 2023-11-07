// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Notes on ANotes, Store {
  late final _$notesAtom = Atom(name: 'ANotes.notes', context: context);

  @override
  ObservableList<String> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<String> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
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

  @override
  String toString() {
    return '''
notes: ${notes}
    ''';
  }
}
