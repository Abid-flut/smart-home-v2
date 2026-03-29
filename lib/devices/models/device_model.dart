import 'package:smart_home_v2/devices/power_state.dart';

class DeviceModel {

  final String id;
  final String name;
  final PowerState powerState;
  final String type;

  DeviceModel({
    required this.id,
    required this.name,
    required this.powerState,
    required this.type
  });

  DeviceModel copyWith({
    String? id,
    String? name,
    PowerState? powerState,
    String? type,
  }){
    return DeviceModel(
        id: id ?? this.id,
        name: name ?? this.name,
        powerState: powerState ?? this.powerState,
        type: type ?? this.type);

  }


}