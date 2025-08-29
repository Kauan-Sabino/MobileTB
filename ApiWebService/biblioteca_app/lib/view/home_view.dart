import 'package:biblioteca_app/view/emprestimo/emprestimo_list_view.dart';
import 'package:biblioteca_app/view/livro/livro_list_view.dart';
import 'package:biblioteca_app/view/usuario/usuario_view_list.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int _index = 0; //indice de navegação das páginas

  final List<Widget> _paginas =[
    LivroListView(),
    EmprestimoListView(),
    UsuarioViewList()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gerenciador de Bibioteca"),),
      body: _paginas[_index],
      bottomNavigationBar: BottomNavigationBar(currentIndex: _index,
      onTap: (value) => setState(() => _index =value,),
      items:[
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Livros"),
        BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "emprestimos"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "usuarios"),
      ]),
    );
  }
}