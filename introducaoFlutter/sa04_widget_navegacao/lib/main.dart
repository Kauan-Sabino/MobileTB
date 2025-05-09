import 'package:flutter/material.dart';
import 'package:sa04_widget_navegacao/view/telaCadastroView.dart';
import 'package:sa04_widget_navegacao/view/telaInicialview.dart';
import 'package:sa04_widget_navegacao/view/telaconfirmacaoview.dart';

void main() {
  runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: "/",
  routes:{/*3 telas de navegção*/
    "/": (context) => TelaInicialView() /*nome da rota*/,
    "/cadastro":(context)=> TelaCadastroView()/*tela de cadastro*/,
    "/confirmacao":(context)=> TelaConfirmacaoView() /*tela de confirmação*/
  },
  ));
}
