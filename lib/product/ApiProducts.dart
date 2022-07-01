import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> listarPost(http.Client client) async {
  final response = await http.get(
      Uri.parse('https://ecommerce-api-react.herokuapp.com/api/v1/products/1'));
  print(response.body);

  return compute(pasaraListas, response.body);
}

Future<List<Product>> userPost(http.Client client) async {
  final response = await http.get(
      Uri.parse('https://ecommerce-api-react.herokuapp.com/api/v1/products'));

  return compute(pasaraListas, response.body);
}

List<Product> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Product>((json) => Product.fromJson(json)).toList();
}

void adicionarProduct(
    String title, String description, String price, String categoryId) async {
  var url = Uri.parse('https://users-crud1.herokuapp.com/users/');

  await http.post(url, body: {
    'title': title,
    'description': description,
    'price': price,
    'categoryId': categoryId
  });
}

void editarProduct(int id, String email, String password, String first_name,
    String last_name, String birthday) async {
  var url = Uri.parse('https://users-crud1.herokuapp.com/users/$id');

  await http.post(url, body: {
    'email': email,
    'password': password,
    'first_name': first_name,
    'last_name': last_name,
    'birthday': birthday,
  });
}

void eliminarProduct(id) async {
  var url = Uri.parse('https://users-crud1.herokuapp.com/users/$id');

  await http.post(url, body: {
    'ideliminar': id,
  });
}
class Data{
  String status;
  Product product;
    

  Data({
    required this.status,
    required this.product,
    
  });
  factory Data.fromJson(Map<String, dynamic> json) {
    
    return Data(
        status: json['status'],
        product: Product.fromJson(json['Product']));
  }
}
class Product {
  final int id;
  final String title;
  final String description;
  final String price;
  

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    
    return Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price']);
  }
  
}
