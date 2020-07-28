import 'dart:async';

import 'package:curso_flutter_basico/services/http_request_services.dart';
import 'package:curso_flutter_basico/ui/pages/informacion_usuario_page.dart';
import 'package:curso_flutter_basico/ui/pages/noticias_page.dart';
import 'package:flutter/material.dart';
import 'package:curso_flutter_basico/ui/pages/lista_contactos_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

List<Widget> pages = [
  ListaContactosPage(),
  InformacionUsuarioPage(),
  NoticiasPage(),
];

GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String titulo = "Contactos App";

  int picker;

  Future<String> descargaImagen() async {
    print("se inicia la descarga de la imagen");

    await Future.delayed(Duration(seconds: 2), () {});
    return "se descargo la imagen";
  }

  @override
  void initState() {
    super.initState();
    picker = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: homeKey,
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                  )),
              ListTile(
                leading: Icon(MdiIcons.homeCircle),
                title: Text('Inicio'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    picker = 0;
                  });
                },
              ),
              ListTile(
                leading: Icon(MdiIcons.accountBox),
                title: Text('Usuario'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    picker = 1;
                  });
                },
              ),
              ListTile(
                leading: Icon(MdiIcons.newspaper),
                title: Text('Noticias'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    picker = 2;
                  });
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton(
              onPressed: ()async {
                /*Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Soy un snackbar!'),
                ));*/
                print("boton flotante presionado!");

                var resultado = await obtenerNoticias();
                if(resultado!=null){
                  print(resultado);
                }else{
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('No hay conexion a internet'),
                  ));
                }

              },
              child: Icon(Icons.add),
            );
          },
        ),
        appBar: AppBar(
          actions: <Widget>[
            picker == 1
                ? IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.pushNamed(context, 'form_usuario');
                    },
                  )
                : SizedBox(),
          ],
          title: Text(titulo),
        ),
        body: pages[picker]);
  }
}
