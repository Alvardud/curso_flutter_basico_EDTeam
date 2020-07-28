import 'package:curso_flutter_basico/controllers/theme_controller.dart';
import 'package:curso_flutter_basico/ui/pages/detalles_contacto_page.dart';
import 'package:curso_flutter_basico/ui/pages/error_page.dart';
import 'package:curso_flutter_basico/ui/pages/form_contacto_page.dart';
import 'package:curso_flutter_basico/ui/pages/form_usuario_page.dart';
import 'package:curso_flutter_basico/ui/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  ErrorWidget.builder =
      (FlutterErrorDetails details) => ErrorPage(details: details);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  ThemeController _controller = ThemeController.instancia;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller.isDark,
      builder: (context, value, child) {
        return MaterialApp(
            routes: {
              'detalle_contacto': (context) => DetallesContactoPage(),
              'form_contacto': (context) => FormContactoPage(),
              'form_usuario': (context) => FormUsuarioPage(),
            },
            title: 'Flutter Demo',
            theme: ThemeData(
              brightness: value ? Brightness.dark : Brightness.light,
              primarySwatch: Colors.green,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: HomePage());
      },
    );
  }
}
