import 'package:smart_home_v2/devices/ha_device_mapper.dart';
import 'package:smart_home_v2/devices/models/device_model.dart';
import 'package:smart_home_v2/devices/services/device_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:smart_home_v2/core/config/ha_config.dart';

class HaDeviceService implements DeviceService {

  final HaDeviceMapper mapper = HaDeviceMapper();

  Future<List<DeviceModel>> fetchDevices() async{

    List<DeviceModel> devices = [];
    final response = await http.get(
      Uri.parse(HaConfig.baseUrl + "/api/states"),
      headers: {
        "Authorization" : "Bearer ${HaConfig.token}",
        "Content-Type" : "application/json"
      }
    );

    if(response.statusCode != 200){
      throw Exception("Failed to load devices");
    }
    final data = jsonDecode(response.body);
    final List<dynamic> list = data;

    for(var item in list){
      if(item['entity_id'].startsWith('switch.')){
        final device = mapper.fromJson(item);
        devices.add(device);
      }
    }

    return devices;
  }

  @override
  Future<void> toggleDevice(String id,bool isCurrentlyOn) async {
    final action = isCurrentlyOn? "turn_off" : "turn_on";

    final response = await http.post(
      Uri.parse("${HaConfig.baseUrl}/api/services/switch/$action"),
      headers: {
        "Authorization" : "Bearer ${HaConfig.token}",
        "Content-Type" : "application/json"

      },
      body: jsonEncode({
        "entity_id" : id
      }),
      
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to toggle device");
    }
    
    
  }

}