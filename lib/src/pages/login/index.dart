import 'package:flutter_architecture/src/blocs/base/bloc_provider.dart';
import 'package:flutter_architecture/src/blocs/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/custom-widgets/container_corner/index.dart';
import 'package:flutter_architecture/src/custom-widgets/container_with_margin/index.dart';
import 'package:flutter_architecture/src/custom-widgets/divider_input/index.dart';
import 'package:flutter_architecture/src/custom-widgets/loading/index.dart';
import 'package:flutter_architecture/src/custom-widgets/logo/index.dart';
import 'package:flutter_architecture/src/pages/login/tabs.dart';
import 'package:flutter_architecture/src/values/strings.dart' as strings;
import 'package:flutter_architecture/src/values/colors.dart' as colors;
import 'package:flutter_architecture/src/values/dimens.dart' as dimens;

import 'form_associado.dart';
import 'form_escritorio.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context).login;

    return Loading(
      message: "Efetuando login...",
      status: bloc.loading,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: _mainContainer(
          context,
          bloc,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[ 
                _logo(),
                _tabs(bloc)
              ],
          )
        )
      )
    );
  }

  Widget _mainContainer(BuildContext context, LoginBloc bloc, Widget child) {
    return StreamBuilder<String>(
      stream: bloc.tab,
      builder: (context, snapshot) {
        return snapshot.data == "escritorio" ?
          Container(
            color: colors.accentColor,
            alignment: Alignment.center,
            child: child
          )
        :
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2.7,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage( 
                    image: AssetImage("assets/images/login_associado_background.png"),
                    fit: BoxFit.cover
                  ) 
                ),
                child: null
              ),
              child
            ]
          );
      }
    );
  }

  Widget _logo() {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        child: Logo()
      )
    );
  }

  Widget _tabs(LoginBloc bloc) {
    return Expanded(
      flex: 2,
      child: ContainerCorner(
          color: Colors.white,
          child: ContainerWithMargin(
            content: Column(
              children: <Widget>[
                DividerInput(),
                Tabs(
                  bloc: bloc
                ),
                DividerInput(), 
                DividerInput(),
                _formWidget(bloc),
                _footer()
              ]
      ))));
  }
  
  Widget _formWidget(LoginBloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.tab,
      builder: (context, snapshot) {
        return snapshot.data == "associado" ?
          Expanded(child: FormAssociado(bloc: bloc))
        : 
          Expanded(child: FormEscritorio(bloc: bloc));
      }
    );
  }

  Widget _footer() {
    return Container(
      padding: EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            strings.login["label_nao_afiliado"],
            style: TextStyle(
              fontSize: dimens.fontTextSmall,
              color: colors.primaryColor
            ),
          ),
          DividerInput(),
          GestureDetector(
            onTap: () => print("filie-se clicado"),
            child: Text(strings.login["link_filie_se"],
                style: TextStyle(
                    fontSize: dimens.fontTextSmall,
                    color: colors.accentColor,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
