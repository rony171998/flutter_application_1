import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Modificar_contacto.dart';
import 'package:flutter_application_1/pages/registrar_contacto.dart';
import 'package:flutter_application_1/pages/Mensaje_responsive.dart';
import 'package:flutter_application_1/usuario/listaUser.dart';
import 'package:flutter_application_1/pages/lista.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  final String _client;
  MyHomePage(this._title, this._client);

  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title +
            "                                                                             " +
            widget._client),
      ),
      body: ListView.builder(
        itemCount: clients.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ModificarContacto(clients[index])))
                  .then((newContacto) {
                if (newContacto != null) {
                  setState(() {
                    clients.removeAt(index);

                    clients.insert(index, newContacto);

                    mensajeResponsive(
                        context, newContacto.name + " se ha modificado ");
                  });
                }
              });
            },
            onLongPress: () {
              removeClient(context, clients[index]);
            },
            title: Text(clients[index].name + " " + clients[index].apellido),
            subtitle: Text(clients[index].profesion),
            leading: CircleAvatar(
              child: Image.network(
                clients[index].foto,
              ),
            ),
            trailing: Text("Edad " +
                ageClient(context, clients[index].fechaNacimiento) +
                "años"),
          );
        },
      ),

      floatingActionButton: SpeedDial(
          icon: Icons.menu,
          activeIcon: Icons.close,
          spacing: 3,
          children: [
            SpeedDialChild(
              child: Icon(Icons.account_circle_sharp),
              label: "Users",
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        ListaUsuarios(title: 'Proyecto Usuarios')));
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.refresh),
              label: "Notificaciones",
              onTap: () {
                
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.handyman),
              label: "Products",
              onTap: () {
                
              },
            )
          ]),
    );
  }

  removeClient(BuildContext context, Client client) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Cliente"),
              content: Text("Esta Seguro de eliminar a " + client.name + "?"),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        this.clients.remove(client);
                        Navigator.pop(context);
                      });
                    },
                    child: Text(
                      "eliminar",
                      style: TextStyle(color: Colors.blue[900]),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "cancelar",
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                )
              ],
            ));
  }

  ageClient(contex, var dateuser) {
    var datenow = DateTime.now().toString().substring(0, 10);
    var age = int.parse(datenow.substring(0, 4)) -
        int.parse(dateuser.substring(0, 4));
    log("message $datenow ");
    if (int.parse(datenow.substring(5, 7)) <
        int.parse(dateuser.substring(5, 7))) {
      age = age - 1;
    } else if (int.parse(datenow.substring(5, 7)) ==
        int.parse(dateuser.substring(5, 7))) {
      if (int.parse(datenow.substring(9)) < int.parse(dateuser.substring(9))) {
        age = age - 1;
      }
    }
    return age.toString();
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
