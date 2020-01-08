import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),

        ],
        ),
      )
    );
  }


  Widget _crearImagen(){
    return Container(
      width: double.infinity,
      child: Image(
              image: NetworkImage('https://www.viajejet.com/wp-content/viajes/Lago-Moraine-Parque-Nacional-Banff-Alberta-Canada-1440x810.jpg'),
            fit: BoxFit.cover,
            height: 200.0,
            ),
    );
  }

  Widget _crearTitulo(){
    return SafeArea(
      child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Paisaje muy bonito', style: estiloTitulo,),
                        SizedBox(height: 7.0,),
                        Text('Una vista de Suiza', style: estiloSubTitulo,),
                      ],
                    ),
                  ),

                  Icon(Icons.star, color: Colors.red, size:30.0),
                  Text('41',style: TextStyle(fontSize: 20.0),)

                ],
              ),
            ),
    );
  }


  Widget _crearAcciones(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call, 'CALL'),  
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'SHARE'),

      ],
    );
  }

  Widget _accion(IconData icon, String texto){
    return Column(
          children: <Widget>[
            Icon(icon, color: Colors.blue,size: 40.0,),
            SizedBox(height: 5.0,),
            Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue),)
          ],
        );

  }

  Widget _crearTexto(){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),

        child: Text(
          'Amet aliquip fugiat anim et qui veniam cupidatat adipisicing est labore. Commodo est eu ea nulla duis cillum anim consectetur adipisicing. Amet Lorem proident adipisicing dolore exercitation tempor voluptate adipisicing enim. Culpa aliqua amet Lorem aute et dolor voluptate cillum non elit officia ipsum. Duis sit officia Lorem id incididunt labore excepteur cupidatat mollit irure amet.',
          textAlign: TextAlign.justify,
          ),
      ),
    );

  }

}
