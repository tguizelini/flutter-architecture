import 'package:flutter_architecture/src/custom-widgets/logo/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/pages/login/tabs.dart';
import 'package:flutter_architecture/src/custom-widgets/container_corner/index.dart';
import 'package:flutter_architecture/src/custom-widgets/container_with_margin/index.dart';
import 'package:flutter_architecture/src/custom-widgets/divider_input/index.dart';

import 'package:flutter_architecture/src/values/strings.dart' as strings;

import 'form_associado.dart';
import 'form_escritorio.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.redAccent,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  constraints: BoxConstraints.expand(width: double.infinity),
                  child: Logo(),
                )
            ),
            Expanded(
                flex: 2,
                child: ContainerCorner(
                    color: Colors.white,
                    content: ContainerWithMargin(
                        content: Column(
                      children: <Widget>[
                        DividerInput(),

                        TabsLogin(),

                        DividerInput(),
                        DividerInput(),

                        //Expanded(child: FormEscritorio()),
                        Expanded(child: FormAssociado()),
                        
                        Container(
                          padding: EdgeInsets.only(bottom: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(strings.login["label_nao_afiliado"]),
                              DividerInput(),
                              GestureDetector(
                                onTap: () => print("filie-se clicado"),
                                child: Text(strings.login["link_filie_se"],
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        )
                      ],
                    ))))
          ],
        ),
      ),
    );
  }
}
