import 'package:mobx/mobx.dart';

part 'user.store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @observable
  String login = "";
 
  @action
  setLogin(String value) => login = value;

  @observable
  String password = "";

  @action
  setPassword(String value) => password = value;  
}