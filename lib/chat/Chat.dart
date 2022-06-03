import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Mensaje_responsive.dart';

class Chat extends StatefulWidget {
  State<StatefulWidget> createState() => _Chat();
}

class _Chat extends State<Chat> {
  late TextEditingController controllerText;
  List<Message> messagess = [
    Message(
      text: "si claro",
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByme: true,
    ),
    Message(
      text: "si claro",
      date: DateTime.now().subtract(Duration(minutes: 10)),
      isSentByme: true,
    ),
    Message(
      text: "si claro",
      date: DateTime.now().subtract(Duration(minutes: 20)),
      isSentByme: true,
    ),
    Message(
      text: "si claro",
      date: DateTime.now().subtract(Duration(minutes: 30)),
      isSentByme: true,
    ),
    Message(
      text: "si claro",
      date: DateTime.now().subtract(Duration(minutes: 40)),
      isSentByme: true,
    ),
    Message(
      text: "si claro",
      date: DateTime.now().subtract(Duration(minutes: 50)),
      isSentByme: true,
    )
  ];
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "hola pedro", messageType: "recibido"),
    ChatMessage(messageContent: "como te va?", messageType: "recibido"),
    ChatMessage(
        messageContent: "hola rony, cuanto vale esa llanta?",
        messageType: "sender"),
    ChatMessage(messageContent: "la de tamaño 22?", messageType: "recibido"),
    ChatMessage(
        messageContent: "si esa", messageType: "enviado"),
  ];

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
        actions: [
          CircleAvatar(
            child: Image.network(
                "https://cdn.dribbble.com/users/819881/screenshots/7212262/media/ab1e9752fe2323f1c8fb2a3c348db544.png?compress=1&resize=400x300&vertical=top"),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"
                          ? Colors.grey.shade200
                          : Colors.blue[200]),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      messages[index].messageContent,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: controllerText,
                      decoration: InputDecoration(
                          hintText: "escribe su mensaje...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      
                      new ChatMessage(
                      messageContent: "controllerText",
                      messageType: "enviado",
                      );
                      setState(() {
                        //messages.add(messages);
                        }
                      ); 
                      mensajeResponsive(context, messages.toString());

                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByme;

  Message({
    required this.text,
    required this.date,
    required this.isSentByme,
  });
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}
