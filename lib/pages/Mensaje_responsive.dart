import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mensajeResponsive(BuildContext context, String name) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Mensaje Informativo"),
            content: Text("El contacto " + name),
          ));
}
