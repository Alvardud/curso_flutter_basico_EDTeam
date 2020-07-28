import 'package:curso_flutter_basico/controllers/lista_contactos_controller.dart';
import 'package:curso_flutter_basico/models/persona_modelo.dart';
import 'package:curso_flutter_basico/ui/widgets/custom_buttons.dart';
import 'package:curso_flutter_basico/ui/widgets/custom_listtile.dart';
import 'package:flutter/material.dart';

class ListaContactosPage extends StatelessWidget {
  ListaContactosController controller = ListaContactosController.instancia;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.contactos,
      builder: (context, value, child) {
        return Container(
          child: Column(
            children: <Widget>[
              CustomButton(),
              Expanded(
                child: ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, picker) {
                    return Dismissible(
                        background: Container(
                          color: Colors.red,
                        ),
                        onDismissed: (direction) => value.removeAt(picker),
                        key: Key(picker.toString()),
                        child: CustomListTile(person: value[picker]));
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
