import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
void main(){
  runApp(Myapp());
}

class Myapp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _MyAppState();
  }
}

class _MyAppState extends State<Myapp>{
    bool temaEscuro = false;
    String nomeUsuario = "";

    @override
    void initState(){
      super.initState();
      carregarPreferencias();
    }
    void carregarPreferencias() async{
      //conecta com as shared preferences e busca as informções armazenadas
      final prefs = await SharedPreferences.getInstance();
      //recupera as informações do sharedPref e armazena como String
      String? jsonString =prefs.getString('config');
      if (jsonString != null){
        //transformo json em MAP - decode
        Map<String,dynamic> config = json.decode(jsonString);
        setState(() {
          //pega as informações com chave armazenadas
          temaEscuro = config['temaEscuro'] ?? false;
          nomeUsuario = config['nome'] ?? "";

        });
      }
    }
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: "app de configurações",
      theme: temaEscuro ? ThemeData.dark() : ThemeData.light(),
      home:ConfigPage()
    );
  }
}
