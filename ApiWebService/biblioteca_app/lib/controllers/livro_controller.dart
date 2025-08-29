import 'package:biblioteca_app/models/livro.dart';
import 'package:biblioteca_app/services/api_service.dart';

class LivroController {

  //get
  Future<List<Livro>> fetchAll() async{

    final list = await ApiService.getList("livros?_sort=nome");
    return list.map((item)=>Livro.fromJson(item)).toList();

  } 

  
}