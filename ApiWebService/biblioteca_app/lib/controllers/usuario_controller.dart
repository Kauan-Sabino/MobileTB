//class pra controller de usuarios
import 'package:biblioteca_app/models/usuario.dart';
import 'package:biblioteca_app/services/api_service.dart';

class UsuarioController {
  //métodos
  //Get 
  Future<List<Usuario>> fetchAll()async{
    //pega a lista o formato List<dynamic>
    final list = await ApiService.getList('usuarios?_sort=nome');
    //Map=lista não ordenada  map=lista ordenada
    return list.map((item)=>Usuario.fromJson(item)).toList();
  }
  //get de unico usuario
  Future<Usuario> fetchOne(String id) async{
    final usuario = await ApiService.getOne("usuario",id);
    return Usuario.fromJson(usuario);
  }
}