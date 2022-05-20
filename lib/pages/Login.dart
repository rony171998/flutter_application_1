import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/my_home_page.dart';

class Login extends StatefulWidget {
  static String id = "Loginpage";
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController controllerName;
  late TextEditingController controllerNumero;

  @override
  void initState() {
    controllerName = new TextEditingController();
    controllerNumero = new TextEditingController();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar Contactos"),
      ),
      body: ListView(children: [
        //TextBox(controllerName, "Nombre"),
        //TextBox(controllerNumero, "telefono"),
        
        ElevatedButton(
            onPressed: () {
              String name = controllerName.text;
              String numero = controllerNumero.text;
              
              if (name.isNotEmpty &&                
                numero.isNotEmpty 
                ) {
                Navigator.pop(context,
                new Client(
                  name: name, 
                  numero: numero,
                  ));
              }
            },
            child: Text("ingresando"))
      ]),
    );
  }
}