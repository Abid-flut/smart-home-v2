import 'package:smart_home_v2/devices/models/device_model.dart';
import 'package:smart_home_v2/devices/power_state.dart';

class HaDeviceMapper{

  DeviceModel fromJson(Map<String,dynamic> json){

    final attributes = json['attributes'];

    final power = json['state'] == 'on' ? PowerState.on : PowerState.off;

    final device = DeviceModel(
        id: json['entity_id'],
        name: attributes['friendly_name'],
        powerState: power,
        type: "Plug");

    return device;

  }



}