import 'package:web_socket_channel/web_socket_channel.dart';


class WebSocketTest {

  void connect(){
    final channel = WebSocketChannel.connect(
      Uri.parse('wss://ws.ifelse.io'),
    );

  print("Web Socket Connected");

  //listen to messages
  channel.stream.listen((message){
    print("Recieved : $message");
  }
  );

  //send message
  channel.sink.add("Hello from Flutter");

  }

}