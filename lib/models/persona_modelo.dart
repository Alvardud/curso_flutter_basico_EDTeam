import 'package:flutter/material.dart';

class PersonaModelo {
  IconData iconoIzquierda;
  IconData iconoDerecha;
  String nombre;
  String descripcion;
  String nickName;
  String telefono;

  PersonaModelo(
      {this.descripcion,
      this.iconoDerecha,
      this.iconoIzquierda,
      this.nombre,
      this.nickName,
      this.telefono});
}

PersonaModelo persona1 = PersonaModelo(
    nombre: 'Alvaro Martinez',
    descripcion: 'Ejemplo de modelo',
    iconoDerecha: Icons.message,
    iconoIzquierda: Icons.person,
    telefono: "143732499",
    nickName: 'Alvardud');
PersonaModelo persona2 = PersonaModelo(
    nombre: 'Pedro Fernandez',
    descripcion: 'Ejemplo de modelo 2',
    iconoDerecha: Icons.message,
    iconoIzquierda: Icons.person,
    telefono: "543543",
    nickName: 'Alvardud');
PersonaModelo persona3 = PersonaModelo(
    nombre: 'Maria Galindo',
    descripcion: 'Ejemplo de modelo 3',
    iconoDerecha: Icons.message,
    telefono: "45543",
    iconoIzquierda: Icons.person,
    nickName: 'Alvardud');
