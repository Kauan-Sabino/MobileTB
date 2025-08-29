class Emprestimo {
  //atributos
  final String? id;// pode ser nulo inicialmente -> id será atribuido por DB
  final String ususario_id;
  final String livro_id;
  final DateTime data_emprestimo;
  final DateTime data_devolucao;
  final bool devolvido;


  //constructor
  Emprestimo({this.id, required this.ususario_id,required this.livro_id,required this.data_emprestimo,required this.data_devolucao,required this.devolvido,});

  //métodos 
  //toJson 
  Map<String,dynamic> toJson() =>{
    "id": id,
    "ususario_id": ususario_id,
    "livro_id": livro_id
  };

  //fromJson
  factory Emprestimo.fromJson(Map<String,dynamic> json) =>
  Emprestimo(
    id:json["id"].toString(),
    ususario_id: json["ususario_id"].toString(),
    livro_id: json["livro_id"].toString(),
    data_emprestimo: json["data_emprestimo"],
    data_devolucao: json["data_devolução"],
    devolvido: json["devolvido"]==1 ? true:false
   
  );
}