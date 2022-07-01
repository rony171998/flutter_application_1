import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Usuario>> listarPost(http.Client client) async {
  //final response =
  //    await client.get('https://desarolloweb2021a.000webhostapp.com/API/listarnotas.php');
  //var id = "2";

  final response =
      await http.get(Uri.parse('http://localhost:4000/api/v1/users'));
  print(response.body);
  
  print(response.statusCode);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final responseJson = json.decode(response.body);
    for (var i = 0; i < responseJson["users"].length; i++) {
      Map<String, dynamic> user = responseJson["users"][i];
      
      Usuario usuario = Usuario(
          id: user["id"],
          email: user["email"],
          password: user["password"],
          first_name: user["first_name"],
          last_name: user["last_name"],
          age: user["age"],
          photo: user["photo"]
          );
      
    }
    return compute(pasaraListas, response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load post');
  }
    
  }
  

Future<List<Usuario>> userPost(http.Client client) async {
  final response =
      await http.get(Uri.parse('http://localhost:4000/api/v1/users'));

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
  String age,
  String photo,
) async {
  var url = Uri.parse('http://localhost:4000/api/v1/users');

  await http.post(url, body: {
    'email': email,
    'password': password,
    'first_name': first_name,
    'last_name': last_name,
    'age': age,
    'photo': photo,
  });
}

void editarUsuario(int id, String email, String password, String first_name,
    String last_name, String age, String photo) async {
  var url = Uri.parse('http://localhost:4000/api/v1/users/$id');

  await http.post(url, body: {
    'email': email,
    'password': password,
    'first_name': first_name,
    'last_name': last_name,
    'age': age,
    'photo': photo,
  });
}

void eliminarUsuario(id) async {
  var url = Uri.parse('http://localhost:4000/api/v1/users/$id');

  await http.post(url, body: {
    'ideliminar': id,
  });
}

class UsuarioResponse {
  String status;
  late final List<Usuario> usuario;
  

  UsuarioResponse({
    required this.status,
    required this.usuario,
  });
  factory UsuarioResponse.fromJson(Map<String, dynamic> json) {
    
    return UsuarioResponse(
        status: json['status'],
        usuario: List<Usuario>.from(json['users'].map((x) => Usuario.fromJson(x))));
  }
  
}

class Usuario {
  final int id;
  final String email;
  final String password;
  final String first_name;
  final String last_name;
  final String age;
  final String photo;

  Usuario({
    required this.id,
    required this.email,
    required this.password,
    required this.first_name,
    required this.last_name,
    required this.age,
    required this.photo,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        id: json['id'],
        email: json['email'],
        password: json['password'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        age: json['age'],
        photo: json['photo']);
  }
}
