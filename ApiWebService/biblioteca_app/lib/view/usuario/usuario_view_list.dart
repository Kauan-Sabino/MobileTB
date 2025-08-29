import 'package:biblioteca_app/controllers/usuario_controller.dart';
import 'package:biblioteca_app/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioViewList extends StatefulWidget {
  const UsuarioViewList({super.key, Usuario? user});

  @override
  State<UsuarioViewList> createState() => _UsuarioViewListState();
}

class _UsuarioViewListState extends State<UsuarioViewList> {

  //atributos
  final _controller = UsuarioController();
  List<Usuario> _usuarios = [];
  bool _loading =true;
  List<Usuario> _filtroUsuario = [];
  final _buscaField = TextEditingController();

  @override
  void initState(){
    super.initState();
    _load();
  }

  void _load () async {
    setState(() => _loading = true,);
    try{
      _usuarios = await _controller.fetchAll();
      _filtroUsuario = _usuarios;
    } catch(e) {

    }
    setState(() => _loading = false);
  }

  void _filtrar(){
    final busca =  _buscaField.text.toLowerCase();
    setState(() {
      _filtroUsuario = _usuarios.where((user) {
       return user.nome.toLowerCase().contains(busca) ||
        user.email.toLowerCase().contains(busca);
      }).toList();
    });
  }

  void _openForm({Usuario? user}) async{
    await Navigator.push (context,
    MaterialPageRoute(builder: (context) => UsuarioViewList(user : user,))
    );

  }

  void _delete(Usuario user) async{
    if(user.id == null )return;
    final confirm = await showDialog<bool>(
      context: context, builder: (context) => AlertDialog(
        title: Text("confirma exclusão"),
        content: Text("deseja realmente excluir o usuario ${user.nome}"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context,false), child: Text("cancelar")),
          TextButton(onPressed: () => Navigator.pop(context,true), child: Text("excluir"))
        ],
      ));
      if (confirm == true) {
        try{
          await _controller.delete(user.id!);
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
              controller: _buscaField,
              decoration: InputDecoration(labelText:"Pesquisar usuario"),
              onChanged: (value) => _filtrar(),
            ),
            Expanded(child: 
            ListView.builder(
              itemCount: _filtroUsuario.length,
              itemBuilder: (context,index){
                final user = _filtroUsuario[index];
                return Card(
                  child: ListTile(
                    title: Text(user.nome),
                    subtitle: Text(user.email),
                    //trailing
                    trailing: Row(mainAxisSize: MainAxisSize.min, 
                    children: [IconButton(onPressed: ()=>_openForm(user:user), icon: Icon(Icons.edit)),//ediatar usuario
                    IconButton(onPressed: ()=>_delete(user),
                    icon: Icon(Icons.delete, color:Colors.amber ,),)
                    ]
                  ),
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