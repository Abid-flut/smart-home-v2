import 'package:flutter/material.dart';
import 'package:smart_home_v2/devices/device_status.dart';
import 'package:smart_home_v2/devices/models/device_model.dart';
import 'package:smart_home_v2/devices/power_state.dart';
import 'package:smart_home_v2/devices/services/device_service.dart';
import 'package:smart_home_v2/devices/services/ha_websocket_service.dart';


class DeviceProvider extends ChangeNotifier{

  final DeviceService _service;

  DeviceProvider(this._service);

  final List<DeviceModel> _devices =[];
  List<DeviceModel> get devices => _devices;
  DeviceStatus _status = DeviceStatus.idle;
  DeviceStatus get status => _status;

  final Map<String,DeviceStatus> _deviceStatus ={};

  DeviceStatus getStatus(String id) {
    return _deviceStatus[id] ?? DeviceStatus.idle;
  }

  Future<void> fetchDevices() async{

    _status = DeviceStatus.loading;
    notifyListeners();

    try{
      final devices = await _service.fetchDevices();
      _devices.clear();
      _devices.addAll(devices);
      _status = DeviceStatus.idle;
    }
    catch(e){
      _status = DeviceStatus.error;
    }

    notifyListeners();

  }

  Future<void> toggleDevice(String id) async{

    final device = _devices.firstWhere((d) => d.id == id);
    final isCurrentlyOn = device.powerState == PowerState.on;

    _deviceStatus[id] = DeviceStatus.updating;
    notifyListeners();

    try{
      await _service.toggleDevice(id,isCurrentlyOn);
      await fetchDevices();
      _deviceStatus[id] = DeviceStatus.idle;
    }
    catch(e){
      _deviceStatus[id] = DeviceStatus.error;
    }
    notifyListeners();

  }

  void clearDevices() {

    _devices.clear();
    notifyListeners();


  }




}