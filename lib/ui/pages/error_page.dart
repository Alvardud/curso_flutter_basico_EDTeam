import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final FlutterErrorDetails details;

  ErrorPage({this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: RaisedButton(onPressed: (){

        },child: Text('Reportar Error'),),
      ),
    );
  }
}
