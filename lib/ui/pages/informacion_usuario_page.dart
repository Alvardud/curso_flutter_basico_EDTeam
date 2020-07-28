import 'dart:convert';
import 'package:curso_flutter_basico/services/shared_preferences_services.dart';
import 'package:flutter/material.dart';

class InformacionUsuarioPage extends StatelessWidget {
  final IconData customIcon = IconData(0xea93, fontFamily: 'CustomIcon');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FutureBuilder(
            future: SharedPreferencesServices.readString(key: 'imagen'),
            builder: (context, resultado) {
              if (resultado.hasData) {
                return Container(
                  height: 150.0,
                  width: 150.0,
                  child: Image.memory(base64Decode(resultado.data),
                      fit: BoxFit.cover),
                );
              } else {
                return Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage("assets/gatito.jpg"),
                          fit: BoxFit.cover)),
                );
              }
            },
          ),
          FutureBuilder(
            future: SharedPreferencesServices.readString(key: 'nombre'),
            builder: (context, resultado) {
              if (resultado.hasData) {
                return Text(
                  resultado.data,
                  style: Theme.of(context).textTheme.headline6,
                );
              }
              return Text('');
            },
          ),
          FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString("assets/data.json"),
            builder: (context, resultado) {
              if (resultado.hasData) {
                final data = jsonDecode(resultado.data);
                return Column(
                  children: <Widget>[
                    SizedBox(height: 8.0),
                    Text(
                      data['telefono'],
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
