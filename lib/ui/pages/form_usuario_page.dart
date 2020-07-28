import 'dart:convert';
import 'dart:io';

import 'package:curso_flutter_basico/services/file_service.dart';
import 'package:curso_flutter_basico/services/shared_preferences_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

GlobalKey<ScaffoldState> pageUsuariokey = GlobalKey<ScaffoldState>();
GlobalKey<FormState> formUsuarioKey = GlobalKey<FormState>();

class FormUsuarioPage extends StatefulWidget {
  @override
  _FormUsuarioPageState createState() => _FormUsuarioPageState();
}

class _FormUsuarioPageState extends State<FormUsuarioPage> {
  TextEditingController _nombreController;
  TextEditingController _telefonoController;

  String path;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: "");
    _telefonoController = TextEditingController(text: "");
    path = "";
  }

  bool validateAll() {
    if (formUsuarioKey.currentState.validate()) {
      return true;
    } else {
      pageUsuariokey.currentState.showSnackBar(
          SnackBar(content: Text('Inserte todos los datos necesarios')));
      return false;
    }
  }

  String validate(String value, String key) =>
      value.isEmpty ? "Inserte su ${key}" : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: pageUsuariokey,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Nuevo Contacto'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formUsuarioKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp("[A-Z a-z]"))
                    ],
                    validator: (value) => validate(value, "nombre"),
                    decoration: InputDecoration(
                        hintText: 'Nombre',
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Ej. Alvaro Martinez',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor))),
                    onChanged: (value) => () {},
                    controller: _nombreController,
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp("[0-9]"))
                    ],
                    validator: (value) => validate(value, "telefono"),
                    decoration: InputDecoration(
                      hintText: 'Telefono',
                      labelText: 'Ej. (+591) 873468128',
                      prefixIcon: Icon(Icons.call),
                    ),
                    onChanged: (value) => () {},
                    controller: _telefonoController,
                  ),
                  path == ""
                      ? SizedBox()
                      : Container(
                          child: Image.file(File(path)),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      OutlineButton(
                        onPressed: () async {
                          String image =
                              await FileService.getImage(camera: true);
                          setState(() {
                            path = image;
                          });
                        },
                        child: Text('Abrir camara'),
                      ),
                      OutlineButton(
                        onPressed: () async {
                          String image = await FileService.getImage();
                          setState(() {
                            path = image;
                          });
                        },
                        child: Text('Abrir galeria'),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      File file = File(path);
                      String imageConvert =
                          base64Encode(file.readAsBytesSync());

                      SharedPreferencesServices.writeString(
                          key: 'nombre', value: _nombreController.text);
                      SharedPreferencesServices.writeString(
                          key: 'telefono', value: _telefonoController.text);
                      SharedPreferencesServices.writeString(
                          key: 'imagen', value: imageConvert);

                      print("se guardo las preferencias");
                    },
                    child: Text(
                      'Actualizar usuario',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _telefonoController.dispose();
    super.dispose();
  }
}
