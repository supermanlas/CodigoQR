import 'package:flutter/material.dart';


class HomePage extends StatelessWidget{

  final TextStyle estiloTexto = new TextStyle( fontSize: 30 );

  final conteo = 10;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Título'),
        centerTitle: true,
        elevation: 50.8,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Número de taps: ',style: estiloTexto,),
            Text('$conteo', style: estiloTexto,),

          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),        
        onPressed: (){

          print('Hola Mundo!');
          //conteo++;

        }
        ),
      );
  }


}