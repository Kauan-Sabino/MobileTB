import 'package:biblioteca_app/controllers/usuario_controller.dart';
import 'package:biblioteca_app/models/usuario.dart';
import 'package:biblioteca_app/view/usuario/usuario_view_list.dart';
import 'package:flutter/material.dart';

class UsuarioFormView extends StatefulWidget {

  final Usuario? user;

  const UsuarioFormView({super.key, this.user});

  @override
  State<UsuarioFormView> createState() => _UsuarioFormViewState();
}

class _UsuarioFormViewState extends State<UsuarioFormView> {

  final _formkey = GlobalKey<FormState>();
  final _controller = UsuarioController();
  final _nomeField = TextEditingController();
  final _emailField = TextEditingController();

  @override
  void initState(){
    super.initState();
    if(widget.user != null) {
      _nomeField.text = widget.user!.nome;
      _emailField.text = widget.user!.email;
    }
  }

  void _save() async{
    if(_formkey.currentState!.validate()){
      final user = Usuario(
      id:DateTime.now().millisecond.toString(),
      nome: _nomeField.text.trim(),
      email: _emailField.text.trim());
      try{
        await _controller.create(user);
      }catch (e) {

      }
      Navigator.pop(context);
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => UsuarioViewList()));

    }
  }

  void _update() async{
    if(_formkey.currentState!.validate()){
      final user = Usuario(
        id:widget.user?.id!,
        nome: _nomeField.text.trim(), 
        email: _emailField.text.trim());
      try{
        await _controller.update(user);
      }catch (e) {

      }
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UsuarioViewList()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.user == null ? "novo usuario": "editar usuario"),
      ),
      body:Padding(padding: EdgeInsets.all(16),
        child:
        Column(children: [
            TextFormField(
              controller: _nomeField,
              decoration: InputDecoration(labelText:"nome" ),
              validator: (value) => value!.isEmpty ? "informe o nome" : null,
            ),
             TextFormField(
              controller: _emailField,
              decoration: InputDecoration(labelText:"email" ),
              validator: (value) => value!.isEmpty ? "informe o email" : null,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: widget.user == null ? _save : _update, 
            child: Text(widget.user == null ? "Salvar" : "Atualizar"))

          ],
        )
      )
    );
  }
}