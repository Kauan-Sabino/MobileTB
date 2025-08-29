
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_web_service_clima/models/clima_model.dart';

class ClimaController {
  final String _apiKey = "bcbe90a3b843977357a7708723cd44d7";
 //método
 Future<Clima?> getClima(String cidade) async{
  //converte String em URL
  final url= Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$cidade&appid=$_apiKey&units=metric&lang=pt_br");
  final res = await http.get(url);

  //verificar se deu certo
  if(res.statusCode ==200){
    final dados = json.decode(res.body);
    return Clima.fromJson(dados);
  }else{
    return null;
  }
 }
}