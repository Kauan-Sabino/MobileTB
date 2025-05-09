import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ListaTarefas()));
}

class ListaTarefas extends StatefulWidget {
  // chamar as mudanças de estrutura
  @override
  _ListaTarefasState createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  //atributo
  final TextEditingController _tarefaController = TextEditingController();
  List<Map<String, dynamic>> _tarefas = [];
  //construtor
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Tarefas")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _tarefaController,
              decoration: InputDecoration(labelText: "Digite uma Tarefa"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _adicionarTarefa,
              child: Text("Adicionar Tarefa"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder:
                    (context, index) => ListTile(
                      title: Text(
                        _tarefas[index]["titulo"],
                        style: TextStyle(
                          //uso do operador ternario para marcar tarefa concluida ou não(if,else)
                          //(condição) ? caso verdadeiro : caso falso
                          decoration:
                              _tarefas[index]["concluida"]
                                  ? TextDecoration.lineThrough
                                  : null,
                        ),
                      ),
                      leading: Checkbox(
                        value: _tarefas[index]["concluida"],
                        onChanged:
                            (bool? valor) => setState(() {
                              _tarefas[index]["concluida"] = valor!;
                            }),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _removertarefasconcluidas,
        child: Icon(Icons.cancel),
      ),
    );
  } //fim do build

  void _adicionarTarefa() {
    if (_tarefaController.text.trim().isNotEmpty) {
      setState(() {
        _tarefas.add({"titulo": _tarefaController.text.trim(), "concluida": false});
        _tarefaController.clear();
      });
    }
  }

  void _removertarefasconcluidas() {
    setState(() {
      //setState permite fazer alteração de estado
      _tarefas.removeWhere((tarefa) => tarefa['concluida']);
    });
  }
} //fim da classe
