import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/views/registro_view.dart';

class LoginView extends StatefulWidget{
  
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailField = TextEditingController();
  final _senhaField = TextEditingController();

  void _signIn()async{
    try{
      await _auth.signInWithEmailAndPassword(
        email: _emailField.text.trim(),
        password: _senhaField.text);
    } catch (e ){
      ScaffoldMessenger.of(context). showSnackBar(SnackBar(content: Text("Falha oa fazer login: $e"),));
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("login"),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child:Column(
          children: [
            TextField(
              controller: _emailField,
              decoration: InputDecoration(labelText: "email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller:_senhaField,
              decoration: InputDecoration(labelText: "senha"),
              obscureText: true,
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _signIn, 
              child: Text("login")),
              TextButton(
              onPressed: ()=>Navigator.push(context,
              MaterialPageRoute(builder: (context)=> RegistroView())),
              child: Text("Não tem uma conta? Registre aqui"))
          ],
        )
      )
    );
  }
}