import 'package:biblioteca_app/models/livro.dart';
import 'package:biblioteca_app/services/api_service.dart';

class LivroController {

  //get
  Future<List<Livro>> fetchAll() async{

    final list = await ApiService.getList("livros?_sort=nome");
    return list.map((item)=>Livro.fromJson(item)).toList();

  } 

  Future<Livro> fetchOne(String id) async{
    final livro = await ApiService.getOne("livros", id);
    return Livro.fromJson(livro);
  }

  //post
  Future<Livro> create(Livro livuro) async{
    final created = await ApiService.post("livros", livuro.toJson());
    return Livro.fromJson(created);

  }

  //put
  Future<Livro> update(Livro livuro) async{
    final updated = await ApiService.put("livros", livuro.toJson(), livuro.id!);
    return Livro.fromJson(updated);
  }

  //delete
  Future<void> delete (String id) async{
    await ApiService.delete("livros", id);
  }
}