import 'package:biblioteca_app/models/livro.dart';
import 'package:biblioteca_app/controllers/livro_controller.dart';
import 'package:flutter/material.dart';

class LivroFormView extends StatefulWidget {
  const LivroFormView({super.key,this.livro});

  final Livro ? livro;

  @override
  State<LivroFormView> createState() => _LivroFormViewState();
}

  final _formkey = GlobalKey<FormState>();
  final _controller = LivroController();
  final _titulo = TextEditingController();
  final _Autor = TextEditingController();

  @override
  

class _LivroFormViewState extends State<LivroFormView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();

  }
}