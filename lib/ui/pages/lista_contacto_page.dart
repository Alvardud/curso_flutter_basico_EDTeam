import 'package:curso_flutter_basico/models/persona_modelo.dart';
import 'package:curso_flutter_basico/ui/widgets/custom_buttons.dart';
import 'package:curso_flutter_basico/ui/widgets/custom_listtile.dart';
import 'package:flutter/material.dart';

List<PersonaModelo> persons = [
  persona1,
  persona2,
  persona3,
];


class ListaContactoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CustomButton(),
          Expanded(
            child: ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, picker) {
                return Dismissible(
                    background: Container(
                      color: Colors.red,
                    ),
                    onDismissed: (direction) => persons.removeAt(picker),
                    key: Key(picker.toString()),
                    child: CustomListTile(person: persons[picker]));
              },
            ),
          )
        ],
      ),
    );
  }
}
