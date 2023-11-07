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

  late final _$isEditAtom = Atom(name: 'ANotes.isEdit', context: context);

  @override
  bool get isEdit {
    _$isEditAtom.reportRead();
    return super.isEdit;
  }

  @override
  set isEdit(bool value) {
    _$isEditAtom.reportWrite(value, super.isEdit, () {
      super.isEdit = value;
    });
  }

  late final _$editedStringAtom =
      Atom(name: 'ANotes.editedString', context: context);

  @override
  String get editedString {
    _$editedStringAtom.reportRead();
    return super.editedString;
  }

  @override
  set editedString(String value) {
    _$editedStringAtom.reportWrite(value, super.editedString, () {
      super.editedString = value;
    });
  }

  late final _$removeAsyncAction =
      AsyncAction('ANotes.remove', context: context);

  @override
  Future<void> remove(int index, BuildContext context) {
    return _$removeAsyncAction.run(() => super.remove(index, context));
  }

  late final _$editAsyncAction = AsyncAction('ANotes.edit', context: context);

  @override
  Future<void> edit(
      int index, BuildContext context, TextEditingController controller) {
    return _$editAsyncAction.run(() => super.edit(index, context, controller));
  }

  late final _$saveAsyncAction = AsyncAction('ANotes.save', context: context);

  @override
  Future<void> save(BuildContext context, TextEditingController controller) {
    return _$saveAsyncAction.run(() => super.save(context, controller));
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
notes: ${notes},
isEdit: ${isEdit},
editedString: ${editedString}
    ''';
  }
}
