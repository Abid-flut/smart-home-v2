import 'package:smart_home_v2/auth/auth_provider.dart';
import 'package:smart_home_v2/auth/auth_status.dart';
import 'package:smart_home_v2/devices/device_provider.dart';

class AppCoordinator{

  AuthProvider authProvider;
  DeviceProvider deviceProvider;

  AppCoordinator({
    required this.authProvider,
    required this.deviceProvider
  });

  AuthStatus? lastStatus;

  void _onAuthChanged(){

    final currentStatus = authProvider.status;

    if(currentStatus == AuthStatus.authenticated && lastStatus != AuthStatus.authenticated){
      deviceProvider.fetchDevices();

    }
    if(currentStatus == AuthStatus.unauthenticated && lastStatus != AuthStatus.unauthenticated){
      deviceProvider.clearDevices();

    }

    lastStatus = currentStatus;

  }

}