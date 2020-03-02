class LoginController{
  bool loading = false;
  setLoading(bool value) => loading = value;

  String login = "";
  setLogin(String value) => login = value;

  String password = "";
  setPassword(String value) => password = value;  
  
  void signIn() async {
    /*
    _setLoading(true);

    final ret = await _repository.login(_login.value, _password.value);

    _setLoading(false);
    
    if (ret.status == 200) {
      CustomToast.show("Success");
    }

    CustomToast.show(ret.message);
    */
  }
}
