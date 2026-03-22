import 'package:smart_home_v2/devices/models/device_model.dart';

abstract class DeviceService {

  Future<List<DeviceModel>> fetchDevices();

  Future<DeviceModel> toggleDevice(String id);




}
