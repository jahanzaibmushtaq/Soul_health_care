import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController {
  final connection = true.obs;
  StreamSubscription? connectionStream;
  Connectivity connectivity = Connectivity();

  void connectionListener() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    checkConnection(result);
    connectionStream = connectivity.onConnectivityChanged.listen((event) {
      checkConnection(event);
      print(connection.value);
    });
  }

  @override
  void onInit() {
    connectionListener();
    super.onInit();
  }

  @override
  void onClose() {
    if (connectionStream != null) {
      connectionStream!.cancel();
    }
    super.onClose();
  }

  void checkConnection(ConnectivityResult event) {
    switch (event) {
      case ConnectivityResult.wifi:
        connection(true);
        break;

      case ConnectivityResult.mobile:
        connection(true);
        break;
      case ConnectivityResult.none:
        connection(false);
        break;
      case ConnectivityResult.vpn:
        connection(true);
        break;
      default:
        connection(false);
    }
  }
}
