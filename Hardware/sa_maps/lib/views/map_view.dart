import 'package:flutter/material.dart';
import 'package:sa_maps/controllers/map_controller.dart';
import 'package:sa_maps/models/location_points.dart';

class MapView extends StatefulWidget {
  const MapView ({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  
  List<LocationPoints> listaPosicoes = [];
  final _mapController = MapController();

  bool _isLoading = false;
  String? _error;

  void _adicionarPonto() async{
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      LocationPoints novaMarcacao = await _mapController.getcurrentLocation();
      listaPosicoes.add(novaMarcacao);
    } catch (e) {
      _error =e.toString();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_error!)));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Mapa de localização"),
      actions: [
        IconButton(onPressed: _adicionarPonto,
         icon: _isLoading
         ? CircularProgressIndicator()
         : Icon(Icons.add_location))
        ],
      ),
    );
  }
}