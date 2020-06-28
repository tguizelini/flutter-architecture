import 'package:mobx/mobx.dart';

abstract class BaseViewModel with Store {
  @observable 
  bool loading = false;

  @action 
  setLoading(bool value) => loading = value;
}