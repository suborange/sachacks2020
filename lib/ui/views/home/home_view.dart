import 'package:flutter/material.dart';
import 'package:lean_provider/core/enums/view_state.dart';
import 'package:lean_provider/core/ui_models/views/home/home_model.dart';
import 'package:lean_provider/ui/views/base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Center(
            child:
                (model.state == ViewState.Busy) ? Container() : Text("home")),
      ),
    );
  }
}
