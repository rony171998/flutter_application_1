import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/my_home_page.dart';

class LoginPage extends StatefulWidget {
  static String id = "Loginpage";
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Image.asset(
                "web/icons/Icon-512.png",
                height: 300.0,
              ),
              SizedBox(
                height: 25.0,
              ),
              _userTextField(),
              SizedBox(
                height: 15.0,
              ),
              _passwordTextField(),
              SizedBox(
                height: 15.0,
              ),
              _bottonLogin(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _userTextField() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          hintText: "usuario",
          labelText: "user",
        ),
      ),
    );
  });
}

Widget _passwordTextField() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock),
          hintText: "contraseña",
          labelText: "contraseña",
        ),
        onChanged: (value) {},
      ),
    );
  });
}

Widget _bottonLogin() {
  TextEditingController controllerName= new TextEditingController();
  TextEditingController controllerNumero= new TextEditingController();
  final Client _client;

  
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return ElevatedButton(
      
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text("Iniciar Sesion"),
          
        ),
        onPressed: () {
          String name =controllerName.text;
          
          String numero=controllerNumero.text;
          
          if (name.isNotEmpty && numero.isNotEmpty) {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => MyHomePage("Mis Contactos")));
          } else {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: Text("Error"),
                      content: Text("Uno de los campos esta Vacio"),
                    ));
          }
        });
  });
}


  


