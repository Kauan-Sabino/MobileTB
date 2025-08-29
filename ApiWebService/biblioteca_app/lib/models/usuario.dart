class Usuario {
  //atributos
  final String? id;// pode ser nulo inicialmente -> id será atribuido por DB
  final String nome;
  final String email;

  //constructor
  Usuario({this.id, required this.nome,required this.email});

  //métodos 
  //toJson obj => Map(Json)
  Map<String,dynamic> toJson() =>{
    "id": id,
    "nome": nome,
    "email": email
  };

  //fromJson json(Map) => obj
  factory Usuario.fromJson(Map<String,dynamic> json) =>
  Usuario(
    id:json["id"].toString(),
    nome: json["nome"].toString(),
    email: json["email"].toString()
  );
}