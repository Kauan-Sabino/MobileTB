import 'package:biblioteca_app/controllers/livro_controller.dart';
import 'package:biblioteca_app/models/livro.dart';
import 'package:flutter/material.dart';

class LivroListView extends StatefulWidget {
  const LivroListView({super.key});

  @override
  State<LivroListView> createState() => _LivroListViewState();
}

class _LivroListViewState extends State<LivroListView> {
  //atributos
  final _controller = LivroController;
  List<Livro> _livros = [];
  bool _loading = true;
  List<Livro> _filtroLivro = [];

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


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

extension on Type {
  Future<List<Livro>> fetchAll() {}
}