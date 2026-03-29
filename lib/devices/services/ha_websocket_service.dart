import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:smart_home_v2/core/config/ha_config.dart';
import 'dart:convert';

class HaWebSocketService{

  final Function(String,String) onDeviceUpdate;

  HaWebSocketService(this.onDeviceUpdate);

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
      if(data['type'] == 'auth_ok'){
        subscribetoEvents();
      }

      if(data['type'] == 'event'){
        final event = data['event'];

        if(event['event_type']== 'state_changed'){
          final entityId = event['data']['entity_id'];
          final newStateObj = event['data']['new_state'];

          if(newStateObj['state'] != null){
            final state = newStateObj['state'];

            if(entityId.startsWith('switch.')){
              onDeviceUpdate(entityId,state);
            }
          }

        }



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