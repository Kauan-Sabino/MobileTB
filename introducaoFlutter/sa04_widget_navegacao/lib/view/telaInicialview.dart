//criar classe da tela inicial
import 'package:flutter/material.dart';

class TelaInicialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Bem Vindo"), centerTitle: true,),
      body: Center(
        child:Column(
          children: [
            Text("Olá, tudo bem? seja bem vindo ao nosso buffet",
              style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()=> Navigator.pushNamed(context,"/cadastro"),
                          child: Text("cadastro"),
            )
          ],
        ) 
      )
    );
  }
}
