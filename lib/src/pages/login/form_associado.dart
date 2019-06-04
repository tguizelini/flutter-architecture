import 'package:flutter_architecture/src/custom-widgets/button/index.dart';
import 'package:flutter_architecture/src/custom-widgets/divider_input/index.dart';
import 'package:flutter_architecture/src/custom-widgets/edit_text/index.dart';
import 'package:flutter_architecture/src/custom-widgets/snackbar/index.dart';
import 'package:flutter_architecture/src/custom-widgets/snackbar/snackbar_action.dart';
import 'package:flutter_architecture/src/custom-widgets/text/index.dart';
import 'package:flutter_architecture/src/custom-widgets/toast/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/login_bloc.dart';
import 'package:flutter_architecture/src/values/strings.dart' as strings;

class FormAssociado extends StatelessWidget {
  final LoginBloc bloc;

  const FormAssociado({Key key, this.bloc}) : super(key: key);

  void _login(BuildContext context) async {
    final isAuth = await bloc.login();

    if (isAuth) {
      CustomToast.show("Navegar para a proxima tela");
    } else {
      CustomSnackbar(
        context: context,
        message: "Código e/ou senha inválidos",
        action: CustomSnackbarAction.show(
          message: "VER MAIS",
          onPress: () => CustomToast.show("Perdeu, play!!"),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        EditText(
          value: bloc.codigo,
          onChange: bloc.setCodigo,
          placeholder: strings.login["associado_input_cod"],
          keyboardType: TextInputType.number,
        ),
        DividerInput(),
        EditText(
          value: bloc.senha,
          onChange: bloc.setSenha,
          password: true,
          placeholder: strings.login["associado_input_senha"]
        ),
        DividerInput(),
        Row(
          children: <Widget>[
            Expanded(
              child: CustomText(
                text: strings.login["label_recuperar_senha"],
              ),
            ),
            CustomButton(
              onPress: () {
                _login(context);
              },
              label: strings.login["button_login"]
            )
          ],
        )
      ],
    );
  }

}