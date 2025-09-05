import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/views/login_view.dart';
import 'package:todo_list/views/tarefas_view.dart';


class AuthView extends StatelessWidget{
  const AuthView({super.key});

  @override
  Widget build(BuildContext context){
    return StreamBuilder<User?>(//identifica se tem um usuario cadastrado no cache instantaneamente
      stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context, snapshot){ // usa os dados do cache pra decidir
        if(snapshot.hasData){
          return TarefasView();
        }
        return LoginView();
      });
  }

}