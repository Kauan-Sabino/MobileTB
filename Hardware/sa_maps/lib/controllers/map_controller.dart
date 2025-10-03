
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:sa_maps/models/location_points.dart';

class MapController {
  final DateFormat _formatar = DateFormat('dd//MM/yyyy - HH:mm:ss');

  //método para pegar geolocaliazcão do ponto
  Future<LocationPoints?> getcurrentLocation() async{
    //solicitar localização atual do dispositivo
    //liberar permissões
    //verificar se o aplicativo possui o serviço de geolocalização

    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return null;
    }
    LocationPermission permission;
    //verifica a permissão de uso do gps 
    permission = await Geolocator.checkPermission();
    //por padrão todo novo aplicativo
    if (permission == LocationPermission.denied){
      //solicitar o acesso a geolocalização
      permission == await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Permissão Negada de Acesso ao GPS");
      }
    }

    Position position = await Geolocator.getCurrentPosition();

    String dataHora = _formatar.format(DateTime.now());
    
    LocationPoints posicaoAtual = LocationPoints(
      latitude: position.latitude,
       longitude: position.longitude,
        timeSatmp: dataHora
      );

      return posicaoAtual;
  }



}