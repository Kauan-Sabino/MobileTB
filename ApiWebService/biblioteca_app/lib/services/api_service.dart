//classe de ajuda para conexão com API

import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  //base url para conexão
  static const _baseUrl = "http://10.109.197.10:3001";

  //métodos static (métodos da Classe e não do Objeto)
  //GET -> Listar todos os recursos
  static Future<List<dynamic>> getList(String path) async{
    final res = await http.get(Uri.parse("$_baseUrl/$path"));
    if(res.statusCode ==200) return json.decode(res.body);//se deu certo interrompe o método
    //se não der certo a conexão -> gerar um erro
    throw Exception("Falha ao Carregar lista de $path");
  }
  //GET _> LIstar apenas um Recurso
  static Future<Map<String,dynamic>> getOne(String path, String id) async{
    final res = await http.get(Uri.parse ("$_baseUrl/$path/$id"));
    if(res.statusCode == 200) return json.decode(res.body);
    //se não deu certo a coneão - gerar um erro
    throw Exception("Erro ao carregar Recurso de $path");
  }

  //POST ->adicionar recurso
  static Future<Map<String,dynamic>> post(String path,Map<String,dynamic> body) async{
    final res = await http.post(
      Uri.parse("$_baseUrl/$path"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(body)
    );
    if(res.statusCode == 201) return jsonDecode(res.body);
    throw Exception("Falha ao criar recurso em $path");
  }

  //PUT _> atualizar um recusrso
  static Future<Map<String,dynamic>> put(String path,Map<String,dynamic> body,String id) async{
    final res = await http.put(
      Uri.parse("$_baseUrl/$path/$id"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(body)
    );
    if(res.statusCode == 200) return jsonDecode(res.body);
    throw Exception("Falha ao atualizar recurso em $path");
  }

  //DELETE -> Deletar um recurso
  static delete (String path, String id) async{
    final res = await http. delete(Uri.parse("$_baseUrl/$path/$id"));
    if (res.statusCode !=200) throw Exception(("Falha ao Deletar Recurso de $path"));
  }
}