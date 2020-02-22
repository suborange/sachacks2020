import 'package:flutter/material.dart';

class NoNetworkView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              "You seem to be offline, please connect to a network to continue to use the app"),
        ),
      ),
    );
  }
}
