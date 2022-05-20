import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/my_home_page.dart';
import 'package:flutter_application_1/pages/Login_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: MyHomePage("Mis Contactos"), 
      /*initialRoute: LoginPage.id,
      routes: {
        LoginPage.id :(context)=> LoginPage(),
      },*/
    );
  }
}
