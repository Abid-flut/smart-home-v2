import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../device_provider.dart';
import '../device_status.dart';
import 'devices_list.dart';

class DevicesCard extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    final provider = context.watch<DeviceProvider>();

    Widget content;

    // 🔹 LOADING
    if (provider.status == DeviceStatus.loading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    // 🔹 ERROR
    else if (provider.status == DeviceStatus.error) {
      content = Column(
        children: [
          const Text(
            "Failed to load devices",
            style: TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              context.read<DeviceProvider>().fetchDevices();
            },
            child: const Text("Retry"),
          )
        ],
      );
    }

    // 🔹 SUCCESS
    else {
      content = DevicesList();
    }

    // 🔹 RETURN YOUR CARD UI (like weather)
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black.withOpacity(0.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Devices",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 10),

          content,
        ],
      ),
    );
  }



}