
import './ApiUser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListaUsuarios extends StatefulWidget {
  
  ListaUsuarios({required this.title});
  final String title;

  @override
  _ListaUsuariosState createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Listados usuarios'),
        actions: [
          IconButton(
              tooltip: 'Adicionar usuario',
              icon: Icon(Icons.add),
              onPressed: () {/*
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Agregarusuario())).then((value) {
                  setState(() {
                    getInfo(context);
                  });
                });*/
              })
        ],
      ),

      body: getInfo(context),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getInfo(context);
          });
        },
        tooltip: 'Refrescar',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
              ? Vistausuarios(usuarios: snapshot.data)
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

class Vistausuarios extends StatelessWidget {
  final List<Usuario> usuarios;
  const Vistausuarios({required this.usuarios});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: usuarios.length == 0 ? 0 : usuarios.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            onTap: () {/*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Perfilusuario(
                          perfil: usuarios, idperfil: posicion)));*/
            },
            leading: Container(
              padding: EdgeInsets.all(5.0),
              width: 50,
              height: 50,
              child: Image.network(usuarios[posicion].first_name),
            ),
            title: Text(usuarios[posicion].first_name),
            subtitle: Text(usuarios[posicion].last_name),
            trailing: Container(
              width: 80,
              height: 40,
              color: Colors.yellowAccent,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(usuarios[posicion].birthday),
            ),
          );
        });
  }
}
