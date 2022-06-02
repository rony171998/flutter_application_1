import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Usuario>> listarPost(http.Client client) async {
  //final response =
  //    await client.get('https://desarolloweb2021a.000webhostapp.com/API/listarnotas.php');
  //var id = "2";
  final response = await http.get(Uri.parse(
      'https://users-crud1.herokuapp.com/users/'));

  // Usa la función compute para ejecutar parsePhotos en un isolate separado
  return compute(pasaraListas, response.body);
}

// Una función que convierte el body de la respuesta en un List<Photo>
List<Usuario> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Usuario>((json) => Usuario.fromJson(json)).toList();
}

void adicionarUsuario(
   String email,
   String password,
   String first_name,
   String last_name,
   String birthday
   ) async {
  var url = Uri.parse(
      'https://users-crud1.herokuapp.com/users/');

  await http.post(url, body: {
    'email': email,
    'password': password,
    'first_name': first_name,
    'last_name': last_name,
    'birthday': birthday,
  });
}

void editarUsuario(
   int id,
   String email,
   String password,
   String first_name,
   String last_name,
   String birthday
   ) async {
  var url = Uri.parse('https://users-crud1.herokuapp.com/users/id');

  await http.post(url, body: {
    
    'email': email,
    'password': password,
    'first_name': first_name,
    'last_name': last_name,
    'birthday': birthday,
    
  });
}

void eliminarUsuario(id) async {
  var url = Uri.parse('https://users-crud1.herokuapp.com/users/id');

  await http.post(url, body: {
    'ideliminar': id,
  });
}

class Usuario {
  final int id;
  final String email;
  final String password;
  final String first_name;
  final String last_name;
  final String birthday;
  

  Usuario({
     required this.id,
     required this.email,
    required this.password,
    required this.first_name,
    required this.last_name,
    required this.birthday,

  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      birthday: json['birthday'],
  
    );
  }
}



