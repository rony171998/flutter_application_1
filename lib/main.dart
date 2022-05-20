import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/my_home_pages.dart';
import 'package:flutter_application_1/pages/Login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD App',
      //home: MyHomePages("Mis Contactos"), 
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id :(context)=> LoginPage(),
      },
       
    );
  }
}
