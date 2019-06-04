import 'package:flutter_architecture/src/blocs/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/button/index.dart';
import 'package:flutter_architecture/src/custom-widgets/divider_input/index.dart';
import 'package:flutter_architecture/src/custom-widgets/edit_text/index.dart';
import 'package:flutter_architecture/src/custom-widgets/text/index.dart';
import 'package:flutter_architecture/src/values/strings.dart' as strings;

class FormEscritorio extends StatelessWidget {
  final LoginBloc bloc;

  const FormEscritorio({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        EditText(
          value: bloc.escritorio,
          onChange: bloc.setEscritorio,
          placeholder: strings.login["escritorio_input_cod_escritoio"],
          keyboardType: TextInputType.number,
        ),
        DividerInput(),
        EditText(
          value: bloc.codigo,
          onChange: bloc.setCodigo,
          placeholder: strings.login["escritorio_input_cod"],
          keyboardType: TextInputType.number,
        ),
        DividerInput(),
        EditText(
          value: bloc.senha,
          onChange: bloc.setSenha,
          password: true,
          placeholder: strings.login["escritorio_input_senha"]
        ),
        DividerInput(),
        Row(
          children: <Widget>[
            Expanded(
              child: CustomText(
                text: strings.login["label_recuperar_senha"],
              )
            ),
            CustomButton(
              onPress: bloc.login,
              label: strings.login["button_login"]
            )
          ],
        )
      ],
    );
  }

}