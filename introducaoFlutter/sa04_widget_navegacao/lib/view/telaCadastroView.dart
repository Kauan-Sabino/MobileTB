import 'package:flutter/material.dart';

class TelaCadastroView extends StatefulWidget {
  _TelaCadastroViewState createState() => _TelaCadastroViewState();
}

class _TelaCadastroViewState extends State<TelaCadastroView> {
  //classe com o método build
  //atributos
  String _nome = "";
  String _email = "";
  double _idade = 13;
  bool _aceiteTermos = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("cadastro"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //Campo do nome
              TextFormField(
                decoration: InputDecoration(labelText: "Digite o nome"),
                validator:
                    (value) =>
                        value!.length >= 3
                            ?  null:"Insira um Nome"
                             , //operador ternário
                onSaved: (value) => _nome = value!,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: "Digite o Email"),
                validator:
                    (value) =>
                        value!.contains("@")
                            ?  null: "Insira um Email Válido", //operador ternário
                onSaved: (value) => _nome = value!,
              ),
              SizedBox(height: 20),
              Text("digite a sua idade"),
              Slider(
                value: _idade,
                min: 13,
                max: 99,
                divisions: 86,
                label: _idade.round().toString(),
                onChanged:
                    (value) => setState(() {
                      _idade = value;
                    }),
              ),
              SizedBox(height: 20),
              CheckboxListTile(
                value: _aceiteTermos,
                title: Text("Aceito os termos de uso."),
                onChanged:
                    (value) => setState(() {
                      _aceiteTermos = value!;
                    }),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _enviarDados, child: Text("Enviar ")),
            ],
          ),
        ),
      ),
    );
  }

  void _enviarDados() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.pushNamed(context, "/confirmacao");
      } 
  }
}

