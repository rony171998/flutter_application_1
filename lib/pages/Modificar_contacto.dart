import 'package:flutter_application_1/pages/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/my_home_page.dart';

class ModificarContacto extends StatefulWidget {
  final Client _client;
  ModificarContacto(this._client);
  @override
  State<StatefulWidget> createState() => _ModificarContacto();
}

class _ModificarContacto extends State<ModificarContacto> {
  late TextEditingController controllerName;
  late TextEditingController controllerApellido;
  late TextEditingController controllerNumero;
  late TextEditingController controllerProfesion;
  late TextEditingController controllerFechaNacimiento;
  late TextEditingController controllerFoto;

  @override
  void initState() {
    Client c = widget._client;
    controllerName = new TextEditingController(text: c.name);
    controllerApellido = new TextEditingController(text: c.apellido);
    controllerNumero = new TextEditingController(text: c.numero);
    controllerProfesion = new TextEditingController(text: c.profesion);
    controllerFechaNacimiento = new TextEditingController(text: c.fechaNacimiento);
    controllerFoto = new TextEditingController(text: c.foto);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar contacto"),
      ),
      body: ListView(
        children: [
          TextBox(controllerName, "Nombre"),
          TextBox(controllerApellido, "Apellido"),
          TextBox(controllerNumero, "Telefono"),
          TextBox(controllerProfesion, "Profesion"),
          TextBox(controllerFechaNacimiento, "FechaNacimiento"),
          TextBox(controllerFoto, "Foto"),
          ElevatedButton(
              onPressed: () {
                String name = controllerName.text;
                String apellido = controllerApellido.text;
                String numero = controllerNumero.text;
                String profesion = controllerProfesion.text;
                //DateTime fechaNacimiento = DateTime.parse(controllerFechaNacimiento.text) ;
                String fechaNacimiento = controllerFechaNacimiento.text;
                String foto = controllerFoto.text;

                if (name.isNotEmpty &&
                    apellido.isNotEmpty &&
                    numero.isNotEmpty &&
                    profesion.isNotEmpty &&
                    fechaNacimiento.isNotEmpty &&
                    foto.isNotEmpty 
                    ) {
                  Navigator.pop(
                      context,
                      new Client(
                          name: name, 
                          apellido: apellido, 
                          numero: numero,
                          profesion: profesion,
                          fechaNacimiento: fechaNacimiento,
                          foto: foto,
                          ));
                }
              },
              child: Text("Guardar Contacto"))
        ],
      ),
    );
  }
}
