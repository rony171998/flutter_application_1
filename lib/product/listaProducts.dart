import 'package:flutter_application_1/pages/Mensaje_responsive.dart';
//import 'package:flutter_application_1/product/UpdateUser.dart';
import 'dart:developer';
import 'ApiProducts.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/product/AddUser.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ListaProducts extends StatefulWidget {
  ListaProducts({required this.title});
  final String title;

  @override
  _ListaProductsState createState() => _ListaProductsState();
}

class _ListaProductsState extends State<ListaProducts> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista products'),
        actions: [
          IconButton(
              tooltip: 'Adicionar product',
              icon: Icon(Icons.add),
              onPressed: () {
                
              })
        ],
      ),

      body: getInfo(context),

      floatingActionButton: SpeedDial(
          icon: Icons.menu,
          activeIcon: Icons.close,
          spacing: 3,
          children: [
            SpeedDialChild(
              child: Icon(Icons.add),
              label: "agregar product",
              onTap: () {
                
                
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.refresh),
              label: "refresh",
              onTap: () {
                setState(() {
                  getInfo(context);
                });
              },
            )
          ]),
      
    );
  }
}

Widget getInfo(BuildContext context) {
  return FutureBuilder(
    future: listarPost(http
        .Client()), //En esta línea colocamos el el objeto Future que estará esperando una respuesta
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {

        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.done:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              ? Vistaproducts(products: snapshot.data)
              : Text('Sin Datos');

        /*
             Text(
              snapshot.data != null ?'ID: ${snapshot.data['id']}\nTitle: ${snapshot.data['title']}' : 'Vuelve a intentar', 
              style: TextStyle(color: Colors.black, fontSize: 20),);
            */

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}

class Vistaproducts extends StatelessWidget {
  final List<Product> products;
  const Vistaproducts({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length == 0 ? 0 : products.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            onTap: () {
              
            },
            leading: Container(
              padding: EdgeInsets.all(5.0),
              width: 50,
              height: 50,
              child: Text(products[posicion].title.substring(0, 1).toUpperCase()),
            ),
            title: Text(products[posicion].title +
                " " +
                products[posicion].description),
            subtitle: Text(products[posicion].price.toString()),
            trailing: Container(
              width: 120,
              height: 40,
              color: Colors.blue[900],
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text("Edad: años")),
            
          );
        });
  }

  
}
