import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:smart_home_v2/core/config/ha_config.dart';
import 'dart:convert';

class HaWebSocketService{

  WebSocketChannel? _channel;

  void connect(){
    _channel = WebSocketChannel.connect(
      Uri.parse("${HaConfig.socketUrl}/api/websocket"),
    );

    print("Ha Websocket Connected");

    _channel!.stream.listen((message){
      print("Raw message: $message");

      final data = jsonDecode(message);
      if(data['type'] == 'auth_required'){
        sendAuth();
      }

    });

  }

  void sendAuth(){

    final message = {
      'type' : 'auth',
      'access_token' : HaConfig.token
    };

    _channel!.sink.add(jsonEncode(message));
    print('auth send');

  }

  void subscribetoEvents(){

    final message = {
      'id' : 1,
      'type' : 'subscribe_events',
      'event_type' : 'state_changed'

    };

    _channel!.sink.add(jsonEncode(message));

    print("Subcribed to events");

  }
}