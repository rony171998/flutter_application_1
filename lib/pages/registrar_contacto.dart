import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/my_home_pages.dart';
import 'package:flutter_application_1/pages/text_box.dart';

class RegistrarContacto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrarContacto();
}

class _RegistrarContacto extends State<RegistrarContacto> {
  late TextEditingController controllerName;
  late TextEditingController controllerApellido;
  late TextEditingController controllerNumero;
  late TextEditingController controllerProfesion;
  late TextEditingController controllerFechaNacimiento;
  late TextEditingController controllerFoto;
  

  @override
  void initState() {
    controllerName = new TextEditingController();
    controllerApellido = new TextEditingController();
    controllerNumero = new TextEditingController();
    controllerProfesion = new TextEditingController();
    controllerFechaNacimiento = new TextEditingController();
    controllerFoto = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar Contactos"),
      ),
      body: ListView(children: [
        TextBox(controllerName, "Nombre"),
        TextBox(controllerApellido, "Apellido"),
        TextBox(controllerNumero, "telefono"),
        TextBox(controllerProfesion, "profesion"),
        TextBox(controllerFechaNacimiento, "fecha de nacimiento"),
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

              if (
                name.isNotEmpty && 
                apellido.isNotEmpty && 
                numero.isNotEmpty &&
                profesion.isNotEmpty &&
                fechaNacimiento.isNotEmpty &&
                foto.isNotEmpty 
                ) {
                Navigator.pop(context,
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
      ]),
    );
  }
}
