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


}