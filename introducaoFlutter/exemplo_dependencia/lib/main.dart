import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  //método pricipal para rodar a aplicação
  runApp(MyApp()); //construtor da classe principal
}

class MyApp extends StatelessWidget {
  //classe principal
  @override
  Widget build(BuildContext context) {
    return MaterialApp(//widget principal -  contem os widget para android
      
      home: Scaffold(
        //tela de vizualização básica
        appBar: AppBar(title: Text("Exemplo App Dependência")),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Olá mundo",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
              );
            },
            child: Text("clique aqui"),
          ),
        ),
      ),
    );
  }
}
