import 'package:flutter_application_1/pages/Mensaje_responsive.dart';
import 'package:flutter_application_1/usuario/UpdateUser.dart';
import 'dart:developer';
import 'ApiUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/usuario/AddUser.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ListaUsuarios extends StatefulWidget {
  ListaUsuarios({required this.title});
  final String title;

  @override
  _ListaUsuariosState createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista usuarios'),
        actions: [
          IconButton(
              tooltip: 'Adicionar usuario',
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            RegistrarUsuario())).then((value) {
                  setState(() {
                    getInfo(context);
                  });
                });
              })
        ],
      ),

      body: getInfo(context),

      floatingActionButton: SpeedDial(
          icon: Icons.menu,
          activeIcon: Icons.close,
          spacing: 3,
          children: [
            SpeedDialChild(
              child: Icon(Icons.add),
              label: "agregar usuario",
              onTap: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegistrarUsuario()))
                    .then((newContact) {
                  if (newContact != null) {
                    setState(() {});
                    mensajeResponsive(context, "se guardo "+newContact);
                  }
                });
                
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.refresh),
              label: "refresh",
              onTap: () {
                setState(() {
                  getInfo(context);
                });
              },
            )
          ]),
      
    );
  }
}

Widget getInfo(BuildContext context) {
  return FutureBuilder(
    future: listarPost(http
        .Client()), //En esta línea colocamos el el objeto Future que estará esperando una respuesta
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {

        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.done:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              ? Vistausuarios(usuarios: snapshot.data)
              : Text('Sin Datos');

        /*
             Text(
              snapshot.data != null ?'ID: ${snapshot.data['id']}\nTitle: ${snapshot.data['title']}' : 'Vuelve a intentar', 
              style: TextStyle(color: Colors.black, fontSize: 20),);
            */

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}

class Vistausuarios extends StatelessWidget {
  final List<Usuario> usuarios;
  const Vistausuarios({required this.usuarios});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: usuarios.length == 0 ? 0 : usuarios.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          UpdateUser(perfil: usuarios, idperfil: posicion)));
            },
            leading: Container(
              padding: EdgeInsets.all(5.0),
              width: 50,
              height: 50,
              child: Text(usuarios[posicion].first_name.substring(0, 1).toUpperCase()),
            ),
            title: Text(usuarios[posicion].first_name +
                " " +
                usuarios[posicion].last_name),
            subtitle: Text(usuarios[posicion].email),
            trailing: Container(
              width: 120,
              height: 40,
              color: Colors.blue[900],
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text("Edad: " +
                  ageClient(context, usuarios[posicion].birthday + " años")),
            ),
          );
        });
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
