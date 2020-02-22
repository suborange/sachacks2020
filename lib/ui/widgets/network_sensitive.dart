import 'package:flutter/material.dart';
import 'package:lean_provider/core/enums/connectivity_status.dart';
import 'package:provider/provider.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;
  final Widget altChild;
  NetworkSensitive({
    this.child,
    this.altChild,
  });

  @override
  Widget build(BuildContext context) {
    // Get our connection status from the provider
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    if (connectionStatus == ConnectivityStatus.WiFi ||
        connectionStatus == ConnectivityStatus.Cellular) {
      return child;
    }

    return altChild;
  }
}
