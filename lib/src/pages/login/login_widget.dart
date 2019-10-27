import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/blocs/auth_bloc.dart';
import 'package:flutter_architecture/src/custom_widgets/button.dart';
import 'package:flutter_architecture/src/custom_widgets/container_corner.dart';
import 'package:flutter_architecture/src/custom_widgets/container_with_margin.dart';
import 'package:flutter_architecture/src/custom_widgets/divider_field.dart';
import 'package:flutter_architecture/src/custom_widgets/edit_text.dart';
import 'package:flutter_architecture/src/custom_widgets/logo.dart';
import 'package:flutter_architecture/src/custom_widgets/text.dart';
import 'package:flutter_architecture/src/helpers/navigation/nav_slide_from_right.dart';
import 'package:flutter_architecture/src/helpers/navigation/nav_slide_from_top.dart';
import 'package:flutter_architecture/src/pages/contact/contact_page.dart';
import 'package:flutter_architecture/src/pages/profile/profile_page.dart';

class LoginWidget {

  Widget header(BuildContext context) {
    return Expanded(
      child: Center(
        child: Logo()
      )
    );
  }

  Widget form(BuildContext context, AuthBloc bloc) {
    return Expanded(
      flex: 2,
      child: ContainerCorner(
        color: Colors.grey[900],
        child: ContainerWithMargin(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              loginForm(context, bloc),
              loginFooter(context)
            ],
          ),
        ),
      )
    );
  }

  Widget loginForm(BuildContext context, AuthBloc bloc) {
    return Column(children: <Widget>[
        EditText(
          value: bloc.login,
          placeholder: "LOGIN",
          keyboardType: TextInputType.number,
        ),
        
        DividerField(),

        EditText(
          password: true,
          value: bloc.senha,
          placeholder: "PASSWORD",
        ),
        
        DividerField(),
        DividerField(),

        CustomButton(
          label: "SIGNIN",
          onPress: () => Navigator.pushReplacement(context, NavSlideFromTop(
            page: ProfilePage())
          ),
        ),

        DividerField(),

        CustomButton(
          label: "CONTACT",
          primary: true,
          onPress: () {
            Navigator.push(context, NavSlideFromRight(page: ContactPage()));
          },
        ),

        DividerField()
      ]
    );
  }

  Widget loginFooter(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomText(
            accent: true,
            small: true,
            text: "ACCENT COLOR",
          ),
          CustomText(
            small: true,
            text: "PRIMARY COLOR",
          ),
          CustomText(
            small: true,
            primaryDark: true,
            text: "PRIMARY DARK COLOR",
          ),
          CustomText(
            small: true,
            dark: true,
            text: "DARK COLOR",
          )
      ],
    );
  }
}