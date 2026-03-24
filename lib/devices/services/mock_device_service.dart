import 'package:smart_home_v2/devices/models/device_model.dart';
import 'package:smart_home_v2/devices/power_state.dart';
import 'package:smart_home_v2/devices/services/device_service.dart';

class MockDeviceService implements DeviceService{

  final List<DeviceModel> _devices = [
    DeviceModel(id: "1", name: "Living Room Light", powerState: PowerState.on, type: "light"),
    DeviceModel(id: "2", name: "Bedroom Fan", powerState: PowerState.off, type: "fan")
  ];

  @override
  Future<List<DeviceModel>> fetchDevices() async{

    await Future.delayed(Duration(seconds: 2));
    return _devices;
  }

  @override
  Future<DeviceModel> toggleDevice(String id) async{

    await Future.delayed(Duration(seconds: 2));

    int index = _devices.indexWhere((d)=>d.id == id);

    final device = _devices[index];

    final updatedDevice = DeviceModel(
        id: device.id,
        name: device.name,
        powerState: device.powerState == PowerState.on ?  PowerState.off : PowerState.on  ,
        type: device.type
    );
    _devices[index] = updatedDevice;

    return updatedDevice;


  }




}