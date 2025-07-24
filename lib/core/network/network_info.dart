import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

 @override
  Future<bool> get isConnected async {
    // 1. First, check if the device is connected to any network (Wi-Fi, mobile, etc.).
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // If no network interface is active, we can be sure there's no internet.
      return false;
    }

    // 2. If a network interface is active, then check for actual internet access
    //    by trying to look up a reliable address.
    try {
      // We use Google's public DNS server as it's highly reliable.
      final result = await InternetAddress.lookup('google.com');

      // If the lookup is successful and returns a valid address, we have internet.
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      // A SocketException means the lookup failed, indicating no internet access.
      return false;
    }
  }
}
