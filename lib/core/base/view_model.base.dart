import 'package:mobx/mobx.dart';

abstract class BaseViewModel {
  @observable 
  bool isLoading = false;

  @action 
  setLoading(bool value) => isLoading = value;
}