import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/login_bloc.dart';
import 'package:flutter_architecture/src/custom-widgets/button.dart';
import 'package:flutter_architecture/src/custom-widgets/divider_input.dart';
import 'package:flutter_architecture/src/custom-widgets/edit_text.dart';
import 'package:flutter_architecture/src/pages/contact/contact.dart';
import 'package:flutter_architecture/src/pages/profile/profile.dart';
import 'package:flutter_architecture/src/utils/navigation/nav_slide_from_right.dart';
import 'package:flutter_architecture/src/utils/navigation/nav_slide_from_top.dart';

class LoginForm extends StatelessWidget {
  final LoginBloc bloc;

  const LoginForm({Key key, @required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
        EditText(
          dark: true,
          keyboardType: TextInputType.number,
          value: bloc.login,
          placeholder: "LOGIN",
        ),
        DividerInput(),
        EditText(
          dark: true,
          password: true,
          value: bloc.senha,
          placeholder: "PASSWORD",
        ),
        DividerInput(),
        DividerInput(),

        CustomButton(
          onPress: () {
            Navigator.pushReplacement(context, NavSlideFromTop(page: ProfilePage()));
          },
          label: "SIGNIN",
        ),
        DividerInput(),

        CustomButton(
          primary: true,
          onPress: () {
            Navigator.push(context, NavSlideFromRight(page: ContactPage()));
          },
          label: "CONTACT",
        ),

        DividerInput(),
        DividerInput(),
        DividerInput()
      ]
    );
  }
}