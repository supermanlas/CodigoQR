import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/bloc/scans_bloc.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:qrreaderapp/src/pages/direcciones_page.dart';
import 'package:qrreaderapp/src/pages/mapas_page.dart';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:qrreaderapp/src/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scanBloc = new ScansBloc();

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: scanBloc.borrarScansTodos,
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: _scanQR,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scanQR() async{

    // https://fernando-herrera.com
    // geo:40.73255860802501,-73.89333143671877
    
    String futureString;

    try{
      futureString = await BarcodeScanner.scan();
    } catch (e){
      futureString = e.toString();
    }

    if(futureString != null){

      final scan = ScanModel(valor: futureString);
      scanBloc.agregarScan(scan);

      // final scan2 = ScanModel(valor: 'geo:40.73255860802501,-73.89333143671877');
      // scanBloc.agregarScan(scan2);

      if(Platform.isIOS){
        Future.delayed(Duration(milliseconds: 750),(){
          utils.abrirScan(context, scan);
        } );
      } else {
        utils.abrirScan(context, scan);
      }

      
    }


  }

  Widget  _crearBottomNavigationBar(){
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapa'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_1),
          title: Text('Direcciones'),
        )
      ],
    );
  }

  Widget _callPage(int paginaActual){
    switch(paginaActual){

      case 0: return MapasPage();
      case 1: return DireccionesPage();

      default:
        return MapasPage();
    }
  }
}