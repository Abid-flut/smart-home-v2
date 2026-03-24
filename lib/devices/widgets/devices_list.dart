import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_v2/devices/device_provider.dart';
import 'package:smart_home_v2/devices/device_status.dart';

import '../power_state.dart';

class DevicesList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final deviceProvider = context.watch<DeviceProvider>();

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: deviceProvider.devices.length,
        itemBuilder: (context,index){



          final device = deviceProvider.devices[index];
          final status = deviceProvider.getStatus(device.id);


          Widget trailing;
          if (status == DeviceStatus.updating) {
            trailing = const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          } else {
            trailing = Switch(
              value: device.powerState == PowerState.on,
              onChanged: status == DeviceStatus.updating ? null :
                  (_) {
                deviceProvider.toggleDevice(device.id);
              },
            );
          }

          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            title: Text(device.name,style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),),
            trailing: trailing,
            subtitle: Text(
              device.powerState == PowerState.on ? "On" : "Off",
              style: TextStyle(
                color: Colors.white70
              ),
            ),
          );
        }
    );
  }


}