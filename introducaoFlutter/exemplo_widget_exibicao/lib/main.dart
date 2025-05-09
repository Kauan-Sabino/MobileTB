import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //build visual - widget build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(title: Text("Exemplo Widget Exibição")),
        body:Center(
          child: Column(
            children: [
            Text("um texto qualquer",
              style:TextStyle( 
              fontSize:20,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),),
            Image.network('https://imgs.search.brave.com/ITSwYdnjunpwV096qWE0TVEkjvzXGB7eydR9rwdcF0g/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jYW1v/LmdpdGh1YnVzZXJj/b250ZW50LmNvbS9j/NTA5NzNjMTVmYzBl/MDM5YThkODYzOWU4/ZWQwMGIzM2ExNWUw/NDhmMmYwMmJlZGNl/YzljN2ZkNDY4OGE5/NDg5LzY4NzQ3NDcw/NzMzYTJmMmY3Mzc0/NmY3MjYxNjc2NTJl/Njc2ZjZmNjc2YzY1/NjE3MDY5NzMyZTYz/NmY2ZDJmNjM2ZDcz/MmQ3Mzc0NmY3MjYx/Njc2NTJkNjI3NTYz/NmI2NTc0MmY2MzM4/MzIzMzY1MzUzMzYy/MzM2MTMxNjEzNzYy/MzA2NDMzMzY2MTM5/MmU3MDZlNjc',
              width: 200,
              height: 200,
              fit: BoxFit.cover),
            Image.asset("assets/img/uga.png",
              width: 200,
              height: 200,
              fit: BoxFit.cover,),
            Icon(Icons.star,
              size: 100,
              color:Colors.amber)
            ],
          )
        ),
      ),
    );
  }
}
