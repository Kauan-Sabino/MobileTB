import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/firebase_options.dart';
import 'package:todo_list/views/auth_views.dart';

void main() async{//sincroniza com o firebase enquanto compila a build do aplicativo

  WidgetsFlutterBinding.ensureInitialized();
  //inicializa o firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform

  );
  runApp(MaterialApp(
    title:"Lista de Tarefas" ,
    home: AuthView(),
  ));
}