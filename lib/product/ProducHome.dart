import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_application_1/usuario/listaUser.dart';

class ProducHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produts',
      home: Scaffold(
        floatingActionButton: SpeedDial(
          icon: Icons.menu,
          activeIcon: Icons.close,
          spacing: 3,
          children: [
            SpeedDialChild(
              child: Icon(Icons.add),
              label: "agregar Product",
              onTap: () {
                
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.refresh),
              label: "refresh",
              onTap: () {
                
              },
            )
          ]),
        appBar: AppBar(
          title: Text('Products'),
          actions: [
          IconButton(
              tooltip: 'Search Product',
              icon: Icon(Icons.search),
              onPressed: () {
                
              })
        ],
        ),
        body: getInfo(context),
      ),
    );
  }
}

