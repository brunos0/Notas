import 'package:mobx/mobx.dart';
import 'package:provaflutter/components/field_status.dart';

part 'form_error.g.dart';

class FormError = AFormError with _$FormError;

abstract class AFormError with Store {
  @observable
  ObservableMap<String, bool> fields = ObservableMap.of(FieldStatus().fields);

  @action
  void errorHappend(String label) {
    fields[label] = true;
  }

  @action
  void clearError(String label) {
    fields[label] = false;
  }
}
