import 'dart:convert';
void main(){
  //string no fortmato Json ->
  String jsonString = '{"usuario": "João","login":"João_user" "senha":1234,"ativo":true}';
  //coverteu a string em MAP -> usando Json. Convert (decode)
  Map<String,dynamic> usuario = json.decode(jsonString);
  //acesso aos elementos (Atributos) do Json
  print(usuario["ativo"]);

  //Manipular Json usando o map
  usuario["ativo"] = false;

  // fazer o encode Map => json(texto)
  jsonString = json.encode(usuario);

  //mostrar o texto no formato JSON
  print(jsonString);
}