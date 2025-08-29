import 'package:biblioteca_app/models/emprestimo.dart';
import 'package:biblioteca_app/services/api_service.dart';

class EmprestimoController {

  //get
  Future<List<Emprestimo>> fetchAll() async{

    final list = await ApiService.getList("emprestimos?_sort=nome");
    return list.map((item)=>Emprestimo.fromJson(item)).toList();

  } 

  Future<Emprestimo> fetchOne(String id) async{
    final emprestimo = await ApiService.getOne("emprestimos", id);
    return Emprestimo.fromJson(emprestimo);
  }

  //post
  Future<Emprestimo> create(Emprestimo empresteemo) async{
    final created = await ApiService.post("emprestimos", empresteemo.toJson());
    return Emprestimo.fromJson(created);

  }

  //put
  Future<Emprestimo> update(Emprestimo empresteemo) async{
    final updated = await ApiService.put("emprestimos", empresteemo.toJson(), empresteemo.id!);
    return Emprestimo.fromJson(updated);
  }

  //delete
  Future<void> delete (String id) async{
    await ApiService.delete("emprestimos", id);
  }
}