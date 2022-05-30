import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HttpApi extends StatelessWidget {
  final Future<Post> post;

  HttpApi({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
    
  }
  Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // Si el servidor devuelve una repuesta OK, parseamos el JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // Si esta respuesta no fue OK, lanza un error.
    throw Exception('Failed to load post');
  }
}

}
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}



