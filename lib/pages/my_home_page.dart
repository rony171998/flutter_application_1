import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Modificar_contacto.dart';
import 'package:flutter_application_1/pages/registrar_contacto.dart';
import 'package:flutter_application_1/pages/Mensaje_responsive.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  MyHomePage(this._title);

  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<Client> clients = [
    Client(name: "rony", apellido: "puche", numero: "300111" ,profesion: "programador" ,fechaNacimiento: "17-04-2022" ,foto: "foto1"),
    Client(name: "moly", apellido: "uche", numero: "300111" ,profesion: "programador" ,fechaNacimiento: "17-04-2022" ,foto: "foto1"),
    Client(name: "alex", apellido: "soto", numero: "300111" ,profesion: "programador" ,fechaNacimiento: "17-04-2022" ,foto: "foto1")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
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
            title: Text(clients[index].name + " " + clients[index].apellido +" ("
            +clients[index].profesion+" )"),
            subtitle: Text(clients[index].numero + " " +clients[index].fechaNacimiento),
            
            leading: CircleAvatar(
              
              child: Text(clients[index].foto),
            ),
            trailing: Icon(
              Icons.account_box_rounded,
              color: Colors.pink,
            ),
            
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (_) => RegistrarContacto()))
              .then((newContact) {
            if (newContact != null) {
              setState(() {
                clients.add(newContact);
                mensajeResponsive(
                    context, newContact.name + " se ha registrado");
              });
            }
          });
        },
        tooltip: "Agregar Contacto",
        child: Icon(Icons.add),
      ),
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
                      style: TextStyle(color: Colors.amber),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }
}

class Client {
  var name;
  var apellido;
  var numero;
  var profesion;
  var fechaNacimiento;
  var foto;

  Client({this.name, this.apellido, this.numero
  ,this.profesion, this.fechaNacimiento, this.foto
  });
}
