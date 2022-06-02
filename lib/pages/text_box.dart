import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  TextBox(this._controller, this._label);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: TextField(
        controller: this._controller,
        decoration: InputDecoration(
            filled: true,
            labelText: this._label,
            suffix: GestureDetector(
              child: Icon(Icons.close),
              onTap: () {
                _controller.clear();
              },
            )),
      ),
    );
  }
}

class TextBoxLogin extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  TextBoxLogin(this._controller, this._label);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 20.0),
      child: TextField(
        controller: this._controller,
        decoration: InputDecoration(
            filled: true,
            labelText: this._label,
            suffix: GestureDetector(
              child: Icon(
                Icons.person,
                color: Colors.blue[900],
              ),
              onTap: () {
                _controller.clear();
              },
            )),
      ),
    );
  }
}

class TextBoxPass extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  TextBoxPass(this._controller, this._label);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 20.0),
      child: TextField(
        obscureText: true,
        controller: this._controller,
        decoration: InputDecoration(
            filled: true,
            hintText: 'Password',
            labelText: this._label,
            suffix: GestureDetector(
              child: Icon(
                Icons.lock,
                color: Colors.blue[900],
              ),
              onTap: () {
                _controller.clear();
              },
            )),
      ),
    );
  }
}

class ComboBox extends StatelessWidget {
  final items = ["Medico", "Abogado", "Programador", "profesor"];
  String? value;
  TextEditingValue _controller;
  final String _label;
  ComboBox(this._controller, this._label);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      
      child: DropdownButton<String>(
        value: value,
        
        items: items.map(buildMenuItem).toList(),
        onChanged: (value) =>  this.value = value,
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));
}
