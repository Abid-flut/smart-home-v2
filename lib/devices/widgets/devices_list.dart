import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_v2/devices/device_provider.dart';

class DevicesList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final deviceProvider = context.watch<DeviceProvider>();

    return ListView.builder(
        itemCount: deviceProvider.devices.length,
        itemBuilder: (context,index){
          final device = deviceProvider.devices[index];
          return ListTile(
            title: Text(device.name),
          );
        }
    );
  }


}