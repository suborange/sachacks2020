import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;

  const CustomCard({Key key, this.backgroundColor, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: backgroundColor,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(20),
      child: child,
    );
  }
}
