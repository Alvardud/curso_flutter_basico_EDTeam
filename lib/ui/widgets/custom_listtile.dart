import 'package:curso_flutter_basico/models/persona_modelo.dart';
import 'package:curso_flutter_basico/ui/pages/detalles_contacto_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const IconData whatsAppIcon = IconData(0xea93, fontFamily: 'CustomIcon');

class CustomListTile extends StatelessWidget {
  final PersonaModelo person;

  CustomListTile({this.person});

  //"https://wa.me/$phone?text=$text";

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, 'detalle_contacto',
            arguments: DetallesContactoPageArguments(
                persona: person, contenido: "Contenido"));
      },
      trailing: SizedBox(
        width: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: Icon(whatsAppIcon),
              onPressed: () {
                launch("https://wa.me/+591${person.telefono}?text='hola'");
              },
            ),
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {
                launch("tel:${person.telefono}");
              },
            ),
          ],
        ),
      ),
      leading: CircleAvatar(
        child: Text(person.nombre[0].toUpperCase()),
      ),
      title: Text(person.nombre),
      subtitle: Text(person.nickName),
    );
  }
}
