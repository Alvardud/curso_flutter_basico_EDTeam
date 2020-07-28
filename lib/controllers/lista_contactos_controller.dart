import 'package:curso_flutter_basico/models/persona_modelo.dart';
import 'package:flutter/cupertino.dart';

class ListaContactosController {
  static List<PersonaModelo> _persons = [
    persona1,
    persona2,
    persona3,
    persona2
  ];

  static final ListaContactosController instancia =
      ListaContactosController._();

  ListaContactosController._();

  ValueNotifier<List<PersonaModelo>> contactos =
      ValueNotifier<List<PersonaModelo>>(_persons);

}
