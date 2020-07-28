import 'package:curso_flutter_basico/controllers/lista_contactos_controller.dart';
import 'package:curso_flutter_basico/models/persona_modelo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

GlobalKey<FormState> formContactoKey = GlobalKey<FormState>();
GlobalKey<ScaffoldState> formPageKey = GlobalKey<ScaffoldState>();

class FormContactoPage extends StatefulWidget {
  final String title;

  FormContactoPage({this.title});

  @override
  _FormContactoPageState createState() => _FormContactoPageState();
}

class _FormContactoPageState extends State<FormContactoPage> {
  TextEditingController _nombreController;
  TextEditingController _nickNameController;
  TextEditingController _telefonoController;

  ListaContactosController _controller = ListaContactosController.instancia;
  PersonaModelo _persona = PersonaModelo();

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: "");
    _nickNameController = TextEditingController(text: "");
    _telefonoController = TextEditingController(text: "");
  }

  bool validateAll() {
    if (formContactoKey.currentState.validate()) {
      return true;
    } else {
      formPageKey.currentState.showSnackBar(
          SnackBar(content: Text('Inserte todos los datos necesarios')));
      return false;
    }
  }

  String validate(String value, String key) =>
      value.isEmpty ? "Inserte su ${key}" : null;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller.contactos,
      builder: (context, value, child) {
        return Scaffold(
            key: formPageKey,
            appBar: AppBar(
              centerTitle: true,
              title: Text(widget.title),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formContactoKey,
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
                        onChanged: (value) => _persona.nombre = value,
                        controller: _nombreController,
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: Theme.of(context).primaryColor)),
                        child: TextFormField(
                          validator: (value) => validate(value, "nickname"),
                          decoration: InputDecoration(
                              hintText: 'NickName',
                              labelText: 'NickName',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                          onChanged: (value) => _persona.nickName = value,
                          controller: _nickNameController,
                        ),
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
                        onChanged: (value) => _persona.telefono = value,
                        controller: _telefonoController,
                      ),
                      SizedBox(height: 32),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          if (validateAll()) {
                            _controller.contactos.value =
                                List.from(_controller.contactos.value)
                                  ..add(_persona);
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          'Agregar Contacto',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _nickNameController.dispose();
    _telefonoController.dispose();
    super.dispose();
  }
}
