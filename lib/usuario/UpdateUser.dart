import 'package:flutter_application_1/usuario/ApiUser.dart';
import 'package:flutter_application_1/pages/text_box.dart';
import 'package:flutter/material.dart';

class UpdateUser extends StatefulWidget {
   final idperfil;
  final List<Usuario> perfil;
  UpdateUser({required this.perfil, this.idperfil});
  @override
  State<StatefulWidget> createState() => _UpdateUser();
}

class _UpdateUser extends State<UpdateUser> {
  late TextEditingController controllerEmail = TextEditingController();
  late TextEditingController controllerPassword = TextEditingController();
  late TextEditingController controllerFirts_name = TextEditingController();
  late TextEditingController controllerLast_name = TextEditingController();
  late TextEditingController controllerAge = TextEditingController() ;
  late TextEditingController controllerPhoto = TextEditingController();

  @override
  void initState() {
    
    controllerEmail = TextEditingController(text: widget.perfil[widget.idperfil].email);
    controllerPassword = TextEditingController(text: widget.perfil[widget.idperfil].password);;
    controllerFirts_name = TextEditingController(text: widget.perfil[widget.idperfil].first_name);;
    controllerLast_name = TextEditingController(text: widget.perfil[widget.idperfil].last_name);;
    controllerAge = TextEditingController(text: widget.perfil[widget.idperfil].age);
    controllerPhoto = TextEditingController(text: widget.perfil[widget.idperfil].photo);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar Usuario"),
      ),
      body: ListView(
        children: [
          TextBox(controllerEmail, "Email"),
        TextBox(controllerPassword, "Password"),
        TextBox(controllerFirts_name, "Firts name"),
        TextBox(controllerLast_name, "Last name"),
        TextBox(controllerAge, "birthday  AAAA-MM-DD"),
        TextBox(controllerPhoto, "Photo"),
          ElevatedButton(
            onPressed: () {

              String email=controllerEmail.text;
              String password=controllerPassword.text;
              String first_name=controllerFirts_name.text;
              String last_name=controllerFirts_name.text;
              String age=controllerAge.text;
              String photo=controllerPhoto.text;

              if (
                email.isNotEmpty &&
                password.isNotEmpty &&
                first_name.isNotEmpty &&
                last_name.isNotEmpty &&
                age.isNotEmpty &&
                photo.isNotEmpty

                ) {

                  editarUsuario( 
                      widget.perfil[widget.idperfil].id,
                      controllerEmail.text,
                      controllerPassword.text,
                      controllerFirts_name.text,
                      controllerLast_name.text,
                      controllerAge.text,
                      controllerPhoto.text
                      
                      );
                  
                  Navigator.pop(context);
              }
            },
            child: Text("Guardar Contacto")
            )
        ],
      ),
    );
  }
}
