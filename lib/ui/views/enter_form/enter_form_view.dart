import 'package:flutter/material.dart';
import 'package:lean_provider/core/ui_models/views/enter_form/enter_form_model.dart';
import 'package:lean_provider/ui/views/base_view.dart';

class EnterFormView extends StatelessWidget {
  const EnterFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<EnterFormModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: model.controller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("cancel"),
                  onPressed: model.cancel,
                ),
                RaisedButton(
                  child: Text("done"),
                  onPressed: model.done,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
