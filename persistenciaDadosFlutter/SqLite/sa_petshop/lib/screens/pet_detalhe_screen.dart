//tela de detalhes do Pet

import 'package:flutter/material.dart';
import 'package:sa_petshop/controllers/consultas_controller.dart';
import 'package:sa_petshop/controllers/pets_controller.dart';
import 'package:sa_petshop/models/consulta_model.dart';
import 'package:sa_petshop/models/pet_model.dart';
import 'package:sa_petshop/screens/add_consulta_screen.dart';

class PetDetalheScreen extends StatefulWidget {
  final int petId; //recebe o id

  const PetDetalheScreen({super.key, required this.petId}); //CONSTRUTOR

  @override
  State<StatefulWidget> createState() {
    return _PetDetalheScreenState();
  }
}

class _PetDetalheScreenState extends State<PetDetalheScreen> {
  //BUILD TELA
  final PetsController _controllerPets = PetsController();
  final ConsultasController _controllerConsultas = ConsultasController();
  bool _isLoading = true;

  Pet? _pet; //inicialmente pode ser nulo

  List<Consulta> _consultas = [];

  @override
  void initState() {
    super.initState();
    _loadPetConsultas();
  }

  Future<void> _loadPetConsultas() async {
    setState(() {
      _isLoading = true;
    });
    try {
      _pet = await _controllerPets.findPetById(widget.petId);
      _consultas = await _controllerConsultas.getConsultasByPet(widget.petId);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Exception $e")));
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
      appBar: AppBar(title: Text("detalhes do Pet")),
      body:
          _isLoading //carrega informações ao iniciar a tela
              ? Center(child: CircularProgressIndicator())
              : _consultas.length ==
                  0 // sen não tiver pet criado -- erro ao carregar a página
              ? Center(child: Text("Erro ao Carregar o Pet"))
              : Padding(
                padding: EdgeInsets.all(16), //constrói as info do pet
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nome: ${_pet!.nome}", style: TextStyle(fontSize: 30)),
                    Text("Nome: ${_pet!.raca}"),
                    Text("Nome: ${_pet!.nomeDono}"),
                    Text("Nome: ${_pet!.telefoneDono}"),
                    Divider(),
                    Text("Consultas:"),
                    _consultas.length ==
                            0 //verifica se tem consultas
                        ? Center(
                          child: Text("Não existe consultas cadastradas"),
                        )
                        : Expanded(
                          child: ListView.builder(
                            //preenche a lista com as consultas do pet
                            itemCount: _consultas.length,
                            itemBuilder: (context, index) {
                              final consulta = _consultas[index];
                              return ListTile(
                                title: Text(consulta.tipoServico),
                                subtitle: Text(consulta.dataHoraFormata),
                                trailing: IconButton(
                                  onPressed: () => _deleteConsulta(consulta.id!),
                                  icon: Icon(Icons.delete),
                                ),
                              );
                            },
                          ),
                        ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(onPressed: ()=> Navigator.push(context,
               MaterialPageRoute(builder: (context)=>AddConsultaScreen(petId: widget.petId)))),
    );
  }

  void _deleteConsulta(int consultaId) async {
    await _controllerConsultas.deleteConsulta(consultaId);
    _loadPetConsultas();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Consulta Deletada com Sucesso")));
  }
}
