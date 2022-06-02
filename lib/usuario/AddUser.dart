import 'package:flutter/material.dart';
import 'package:flutter_application_1/usuario/ApiUser.dart';
import 'package:flutter_application_1/pages/my_home_page.dart';
import 'package:flutter_application_1/pages/text_box.dart';

class RegistrarUsuario extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrarUsuario();
}

class _RegistrarUsuario extends State<RegistrarUsuario> {
  
  late TextEditingController controllerEmail;
  late TextEditingController controllerPassword;
  late TextEditingController controllerFirts_name;
  late TextEditingController controllerLast_name;
  late TextEditingController controllerBIrthday;
 
  

  @override
  void initState() {

    controllerEmail = new TextEditingController();
    controllerPassword = new TextEditingController();
    controllerFirts_name = new TextEditingController();
    controllerLast_name = new TextEditingController();
    controllerBIrthday = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar usuario"),
      ),
      body: ListView(children: [
        
        TextBox(controllerEmail, "Email"),
        TextBox(controllerPassword, "Password"),
        TextBox(controllerFirts_name, "Firts name"),
        TextBox(controllerLast_name, "Last name"),
        TextBox(controllerBIrthday, "birthday  AAAA-MM-DD"),

        ElevatedButton(
            onPressed: () {

              String email=controllerEmail.text;
              String password=controllerPassword.text;
              String first_name=controllerFirts_name.text;
              String last_name=controllerFirts_name.text;
              String birthday=controllerBIrthday.text;

              if (
                email.isNotEmpty &&
                password.isNotEmpty &&
                first_name.isNotEmpty &&
                last_name.isNotEmpty &&
                birthday.isNotEmpty 
                ) {

                  adicionarUsuario(
                      controllerEmail.text,
                      controllerPassword.text,
                      controllerFirts_name.text,
                      controllerLast_name.text,
                      controllerBIrthday.text,
                      );
                  
                  Navigator.of(context).pop();
              }
            },
            child: Text("Guardar Contacto")
            )
      ]),
    );
  }
}
