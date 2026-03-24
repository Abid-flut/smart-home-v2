import 'package:flutter/material.dart';
import 'package:smart_home_v2/devices/device_status.dart';
import 'package:smart_home_v2/devices/models/device_model.dart';
import 'package:smart_home_v2/devices/services/device_service.dart';


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

    _deviceStatus[id] = DeviceStatus.updating;
    notifyListeners();

    try{
      final updatedDevice = await _service.toggleDevice(id);
      int index = _devices.indexWhere((d)=> d.id == id);
      if(index != -1){
        _devices[index] = updatedDevice;
      }
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