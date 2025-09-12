import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistroView extends StatefulWidget{
  const RegistroView ({super.key});

  @override
  State<RegistroView> createState()=> _RegistroViewState();
}

class _RegistroViewState extends State <RegistroView>{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailField = TextEditingController();
  final _senhaField = TextEditingController();
  final _confirmarSenhaField = TextEditingController();
  bool _ocultarSenha = true;
  bool _ocultarConfirmarSenha = true;

  //método pra registro de novo usuario
  void _registrar() async{
    if (_senhaField.text != _confirmarSenhaField.text) return;
    try{
      await _auth.createUserWithEmailAndPassword(
        email: _emailField.text.trim(),
        password: _senhaField.text);
        Navigator.pop(context);//fecha a tela de registro
    } on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Erro ao registrar: $e"))
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("cadastro"),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailField,
              decoration: InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _senhaField,
              decoration: InputDecoration(labelText: "Senha",
              suffix:IconButton(onPressed: ()=>setState(() {
                _ocultarSenha = !_ocultarSenha;
              }), icon: Icon(_ocultarSenha ? Icons.visibility : Icons.visibility_off )) 
              ),
              obscureText: _ocultarSenha, // oculta a senha quando digitada
            ),
            TextField(
              controller: _confirmarSenhaField,
              decoration: InputDecoration(labelText: "confirmar Senha",
              suffix: IconButton(onPressed: ()=> setState(() {
                _ocultarConfirmarSenha = !_ocultarConfirmarSenha;
              }), icon: Icon(_ocultarConfirmarSenha ? Icons.visibility : Icons.visibility_off))
              ),
              obscureText: _ocultarConfirmarSenha, // oculta a senha quando digitada

            ),
            SizedBox(height: 20,),
            _senhaField.text != _confirmarSenhaField.text
            ? Text("As senhas devem ser Iguais", style: TextStyle(color: Colors.red))
            : ElevatedButton(onPressed: _registrar,child: Text("registrar"),),
            TextButton(onPressed: ()=> Navigator.pop, child: Text("voltar")),
          ],
        ),
        ),
    );
  }
}