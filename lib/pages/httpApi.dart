import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Mensajero>> listarPost(http.Client client) async {
  //final response =
  //    await client.get('https://desarolloweb2021a.000webhostapp.com/API/listarnotas.php');
  //var id = "2";
  final response = await http.get(Uri.parse(
      'https://desarolloweb2021a.000webhostapp.com/proyectomensajerosapi/listar.php'));

  // Usa la función compute para ejecutar parsePhotos en un isolate separado
  return compute(pasaraListas, response.body);
}

// Una función que convierte el body de la respuesta en un List<Photo>
List<Mensajero> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Mensajero>((json) => Mensajero.fromJson(json)).toList();
}

void adicionarMensajero(
    String nombre,
    String foto,
    String placa,
    String telefono,
    String whatsapp,
    String moto,
    String soat,
    String tecno,
    String activo
    ) async {
  var url = Uri.parse(
      "https://desarolloweb2021a.000webhostapp.com/proyectomensajerosapi/adicionar.php");

  await http.post(url, body: {
    'nombre': nombre,
    'foto': foto,
    'placa': placa,
    'telefono': telefono,
    'whatsapp': whatsapp,
    'moto': moto,
    'soat': soat,
    'tecno': tecno,
    'activo': activo,
  });
}

void editarMensajero(
    String id,
    String nombre,
    String foto,
    String placa,
    String telefono,
    String whatsapp,
    String moto,
    String soat,
    String tecno,
    String activo) async {
  var url = Uri.parse(
      "https://desarolloweb2021a.000webhostapp.com/proyectomensajerosapi/modificar.php");

  await http.post(url, body: {
    'id': id,
    'nombre': nombre,
    'foto': foto,
    'placa': placa,
    'telefono': telefono,
    'whatsapp': whatsapp,
    'moto': moto,
    'soat': soat,
    'tecno': tecno,
    'activo': activo
  });
}

void eliminarMensajero(id) async {
  var url = Uri.parse(
      "https://desarolloweb2021a.000webhostapp.com/proyectomensajerosapi/eliminar.php");

  await http.post(url, body: {
    'ideliminar': id,
  });
}

class Mensajero {
  final String id;
  final String nombre;
  final String foto;
  final String placa;
  final String telefono;
  final String whatsapp;
  final String moto;
  final String soat;
  final String tecno;
  final String activo;

  Mensajero({
     required this.id,
     required this.nombre,
    required this.foto,
    required this.placa,
    required this.telefono,
    required this.whatsapp,
    required this.moto,
    required this.soat,
    required this.tecno,
    required this.activo,
  });

  factory Mensajero.fromJson(Map<String, dynamic> json) {
    return Mensajero(
      id: json['id'],
      nombre: json['nombre'],
      foto: json['foto'],
      placa: json['placa'],
      telefono: json['telefono'],
      whatsapp: json['whatsapp'],
      moto: json['moto'],
      soat: json['soat'],
      tecno: json['tecno'],
      activo: json['activo'],
    );
  }
}



