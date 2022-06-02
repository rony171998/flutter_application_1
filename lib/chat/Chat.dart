import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/text_box.dart';


class Chat extends StatefulWidget {
  State<StatefulWidget> createState() => _Chat();
}
class _Chat extends State<Chat>{
  late TextEditingController controllerText;
 
  @override
  void initState() {
    controllerText = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          title: Text('Chat'),
          actions:[
            
            CircleAvatar(
              child: Image.network(
                "https://cdn.dribbble.com/users/819881/screenshots/7212262/media/ab1e9752fe2323f1c8fb2a3c348db544.png?compress=1&resize=400x300&vertical=top"
              ),
            ),
          ],
        ),
        
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: ListView(
                children: <Widget>[
                  TextBox(controllerText, "write a message"),
                  
                ],)
                
            ) 
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){

          },
           backgroundColor: Colors.blue[900],
          child: const Icon(Icons.navigation)
        )
        
    );
  }
}