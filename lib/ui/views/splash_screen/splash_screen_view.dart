import 'package:flutter/material.dart';
import 'package:lean_provider/core/ui_models/views/splash_screen/splash_screen_model.dart';
import 'package:lean_provider/ui/views/base_view.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashScreenModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
