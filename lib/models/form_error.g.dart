// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_error.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormError on AFormError, Store {
  late final _$fieldsAtom = Atom(name: 'AFormError.fields', context: context);

  @override
  ObservableMap<String, bool> get fields {
    _$fieldsAtom.reportRead();
    return super.fields;
  }

  @override
  set fields(ObservableMap<String, bool> value) {
    _$fieldsAtom.reportWrite(value, super.fields, () {
      super.fields = value;
    });
  }

  late final _$AFormErrorActionController =
      ActionController(name: 'AFormError', context: context);

  @override
  void errorHappend(String label) {
    final _$actionInfo = _$AFormErrorActionController.startAction(
        name: 'AFormError.errorHappend');
    try {
      return super.errorHappend(label);
    } finally {
      _$AFormErrorActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearError(String label) {
    final _$actionInfo =
        _$AFormErrorActionController.startAction(name: 'AFormError.clearError');
    try {
      return super.clearError(label);
    } finally {
      _$AFormErrorActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fields: ${fields}
    ''';
  }
}
