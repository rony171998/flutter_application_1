import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/my_home_page.dart';
import 'package:flutter_application_1/pages/text_box.dart';


class Login extends StatefulWidget {
  static String id = "Login";
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
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
    final Client client;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: ListView(children: [
        Image.network(
          'https://picsum.photos/250?image=9',
          height: 400.0,
        ),
        
        TextBoxLogin(controllerName, "User"),
        TextBoxPass(controllerNumero, "Password"),
        ElevatedButton(
            
            onPressed: () {
              String name = controllerName.text;
              String numero = controllerNumero.text;

              if (name.isNotEmpty && numero.isNotEmpty) {
                
                //if (name == client.name && numero == client.name) {}
                  
                
                if (name == "admin" && numero == "admin") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MyHomePage("Usuarios")));
                } else {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: Text("Error"),
                            content: Text("Usuario o contraseña incorrecta"),
                          ));
                }
              } else {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text("Error"),
                          content: Text("Uno de los campos esta Vacio"),
                        ));
              }
            },
            child: Text("ingresar"))
      ]),
    );
  }
}
