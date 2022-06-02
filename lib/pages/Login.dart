import 'package:flutter/material.dart';

import 'package:flutter_application_1/pages/my_home_page.dart';
import 'package:flutter_application_1/pages/text_box.dart';
import 'package:flutter_application_1/usuario/AddUser.dart';


class Login extends StatefulWidget {
  static String id = "Login";
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  List<Client> clients = [
    Client(
        name: "rony",
        apellido: "puche",
        numero: "1111",
        profesion: "programador",
        fechaNacimiento: "2001-04-17",
        foto:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/1200px-User_icon_2.svg.png"),
    Client(
        name: "moly",
        apellido: "uche",
        numero: "2222",
        profesion: "programador",
        fechaNacimiento: "2001-04-17",
        foto:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/1200px-User_icon_2.svg.png"),
    Client(
        name: "alex",
        apellido: "soto",
        numero: "3333",
        profesion: "profesor",
        fechaNacimiento: "2001-04-17",
        foto:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/1200px-User_icon_2.svg.png")
  ];
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
        title: Text("Login"),
      ),
      body: ListView(children: [
        Image.network(
          'data:image/jpeg;base64,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',
          height: 400.0,width: 800,
        ),
        TextBoxLogin(controllerName, "User"),
        TextBoxPass(controllerNumero, "Password"),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.blue[900],
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
            ),
            onPressed: () {
              String name = controllerName.text;
              String numero = controllerNumero.text;

              if (name.isNotEmpty && numero.isNotEmpty) {
                for (var i = 0; i < clients.length; i++) {
                  if (name == clients[i].name && numero == clients[i].numero) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                MyHomePage("Usuarios", clients[i].name)));
                                
                  } else if (i > 2) {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text("Error"),
                              content: Text("Usuario o contraseña incorrecta"),
                            ));
                  }
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
            child: Text("ingresar")
          ),
          SizedBox( height: 15.0),
          Text("OR"),
          SizedBox( height: 15.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(240, 80),
              primary: Colors.blue[900],
              textStyle:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
            ),
            onPressed: (){
            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                RegistrarUsuario()));
            }, 
            child: Text("Registrarse"),
          )
      ]),
    );
  }
}

class Client {
  var name;
  var apellido;
  var numero;
  var profesion;
  var fechaNacimiento;
  var foto;

  Client(
      {this.name,
      this.apellido,
      this.numero,
      this.profesion,
      this.fechaNacimiento,
      this.foto});
}
