import 'package:curso_flutter_basico/controllers/main_controller.dart';
import 'package:curso_flutter_basico/controllers/theme_controller.dart';
import 'package:curso_flutter_basico/ui/pages/form_contacto_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  ValueNotifier<String> titulo = ValueNotifier<String>("Agregar contacto");
  ThemeController _controller = ThemeController.instancia;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          titulo.value = "Value notifier button";
          //_controller.changeTheme(true);
          presionadoDeBoton();
          //Navigator.pushNamed(context, 'form_contacto');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FormContactoPage(title: 'Nuevo contacto')));
        },
        child: ValueListenableBuilder(
          valueListenable: titulo,
          builder: (context, value, child) {
            return Container(
              height: 60.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(8.0)),
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(value,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 28.0,
                        fontFamily: 'Better')),
              ),
            );
          },
        ));
  }
}
