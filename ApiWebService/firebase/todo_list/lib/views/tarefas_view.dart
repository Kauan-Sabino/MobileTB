import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';

class TarefasView extends StatefulWidget {
  const TarefasView({super.key});

  @override
  State<TarefasView> createState() => _TarefasViewState();
}

class _TarefasViewState extends State<TarefasView> {
  //atributos
  final _db = FirebaseFirestore
      .instance; //controlador do firestore (envia as tarefas pro DB)
  final User? _user =
      FirebaseAuth.instance.currentUser; // puxa o usuario logado
  final _tarefasField = TextEditingController(); //pegar o titulo da tarefa

  // métodos

  //adicionar tarefa
  void _addTarefa() async {
    if (_tarefasField.text.trim().isEmpty) return;
    //adicionar tarefa no banco firestore
    try {
      await _db
          .collection("usuarios")
          .doc(_user!.uid)
          .collection("tarefas")
          .add({
            "titulo": _tarefasField.text.trim(),
            "concluida": false,
            "dataCriacao": Timestamp.now(),
          });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("erro ao adicionar Tarefas $e")));
    }
  }

  //atualizar tarefa
  void _atualizarTarefa(String id, bool statusAtual) async {
    try {await _db.collection("usuarios")
                  .doc(_user!.uid)
                  .collection("tarefas")
                  .doc(id)
                  .update({"cocluida":!statusAtual});
  }catch (e){
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("erro ao atualizar tarefa $e")));
  }
  }
  //deletar tarefa
  void _deletarTarefa(String id) async{
    try{
      await _db.collection("usuarios")
                  .doc(_user!.uid)
                  .collection("tarefas")
                  .doc(id)
                  .delete();
    }catch (e){

    }
  }

  //build tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("minhas tarefas"),
        actions: [
          IconButton(
            onPressed: FirebaseAuth.instance.signOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      //body das tarefas
      body: Padding(
        padding: EdgeInsetsDirectional.all(16),
        child: Column(
          children: [
            TextField(
              controller: _tarefasField,
              decoration: InputDecoration(
                labelText: "Nova Tarefa",
                border: OutlineInputBorder(),
                suffix: IconButton(
                  onPressed: _addTarefa,
                  icon: Icon(Icons.add),
                ),
              ),
            ),
            SizedBox(height: 20),
            //constri=uir a lista de tarefas StreamBuilder
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _db
                    .collection("usuarios")
                    .doc(_user?.uid)
                    .collection("tarefas")
                    .orderBy("dataCriacao", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
                    return Center(child: Text("nenhuma tarefa encontrada"),);
                  }
                  final tarefas = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: tarefas.length,
                    itemBuilder: (context,index){
                      final tarefa = tarefas[index];
                      //convert Text/Json em Map<String,dynamic>
                      final tarefaMap = tarefa.data() as Map<String,dynamic>;
                      //ajustar as booleanas
                      bool concluida = tarefaMap["concluida"]==1 ? true : false;
                      return ListTile( //para cada item da lista, adiciona um titulo
                        title: Text(tarefaMap["titulo"]),
                        leading:Checkbox(
                          value: concluida,
                           onChanged: (value) => _atualizarTarefa(tarefa.id, concluida)),
                        trailing: 
                          IconButton(onPressed:()=> _deletarTarefa(tarefa.id),
                          icon: Icon(Icons.delete,color: Colors.red,)),
                      );
                    }
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
