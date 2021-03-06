import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App', 
      initialRoute: Login.id,
      theme: ThemeData(primaryColor: Colors.blue[900]),
      routes: {
        Login.id :(context)=> Login(),
      },
    );
  }
}
