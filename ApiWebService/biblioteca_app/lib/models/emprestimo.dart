class Emprestimo {
  //atributos
  final String? id;// pode ser nulo inicialmente -> id será atribuido por DB
  final String ususario_id;
  final String livro_id;
  final DateTime data_emprestimo;

  //constructor
  Emprestimo({this.id, required this.ususario_id,required this.livro_id,required this.data_emprestimo});

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
    livro_id: json["livro_id"].toString()
  );
}