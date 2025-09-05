import 'package:biblioteca_app/controllers/livro_controller.dart';
import 'package:biblioteca_app/models/livro.dart';
import 'package:flutter/material.dart';


class LivroListView extends StatefulWidget {
  const LivroListView({super.key, Livro? livro});

  @override
  State<LivroListView> createState() => _LivroListViewState();
}

class _LivroListViewState extends State<LivroListView> {
  //atributos
  final _controller = LivroController();
  List<Livro> _livros = [];
  bool _loading = true;
  List<Livro> _filtroLivro = [];
  final _filtrar = TextEditingController();

  @override
  void initState(){
    super.initState();
    _load();
  }

  void _load () async{
    setState(()=> _loading= true);
      try{
        _livros = await _controller.fetchAll();
        _filtroLivro = _livros;
      } catch (e) {

      }
      setState(()=> _loading = false
        
      );
  }

  void _filtrarli() {
    final filtro = _filtrar.text.toLowerCase();
    setState(() {
      _filtroLivro = _livros.where((livro){
        return livro.titulo.toLowerCase().contains(filtro) ||
        livro.autor.toLowerCase().contains(filtro);
      }).toList();
    });
  }

  void _openForm({Livro? livro}) async{
    await Navigator.push (context,
    MaterialPageRoute(builder: (context) => LivroListView(livro : livro,))
    );

  }

  void _delete(Livro livro) async{
    if(livro.id == null )return;
    final confirm = await showDialog<bool>(
      context: context, builder: (context) => AlertDialog(
        title: Text("confirmar exclusão"),
        content: Text("deseja realmente excluir livro ${livro.titulo}?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context,false), child: Text("cancelar")),
          TextButton(onPressed: () => Navigator.pop(context,true), child: Text("excluir"))
        ],
      ));
      if (confirm == true) {
        try{
          await _controller.delete(livro.id!);
          _load();
        }catch (e){

        }
      }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
      ? Center(child: CircularProgressIndicator(),)
      : Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _filtrar,
              decoration: InputDecoration(labelText:"Pesquisar por livros"),
              onChanged: (value) => _filtrarli(),
            ),
            Expanded(child: 
            ListView.builder(
              itemCount: _filtroLivro.length,
              itemBuilder: (context,index){
                final livro = _filtroLivro[index];
                return Card(
                  child: ListTile(
                    title: Text(livro.titulo),
                    subtitle: Text(livro.autor),
                  ),
                );
              })),
          ],
        ),
        ),
        floatingActionButton: FloatingActionButton(onPressed:() => _openForm(),
        child: Icon(Icons.add),),
    );
  }
}

extension on Type {
  Future<void> delete(String s) async {}
  
}

  

