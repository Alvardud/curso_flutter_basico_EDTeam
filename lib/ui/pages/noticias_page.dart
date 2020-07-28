import 'dart:convert';
import 'package:curso_flutter_basico/models/noticias_modelo.dart';
import 'package:curso_flutter_basico/services/http_request_services.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiasPage extends StatelessWidget {
  List<NoticiaModelo> noticias = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: obtenerNoticias(),
      builder: (context, respuesta) {
        if (respuesta.hasData) {
          List<dynamic> noticiasJson = jsonDecode(respuesta.data)['results'];
          noticiasJson.forEach((element) {
            NoticiaModelo _noticia = NoticiaModelo.fromJson(element);
            noticias.add(_noticia);
          });
          return ListView.builder(
              itemCount: noticias.length,
              itemBuilder: (context, puntero) {
                return ListTile(
                  onTap: () {
                    launch(noticias[puntero].url);
                  },
                  leading: CircleAvatar(child: Text(puntero.toString())),
                  title: Text(noticias[puntero].titulo),
                  subtitle: Text(noticias[puntero].resumen),
                );
              });
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
