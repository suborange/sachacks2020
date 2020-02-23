import 'package:flutter/material.dart';
import 'package:lean_provider/core/enums/view_state.dart';
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
        body: (model.state == ViewState.Busy)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        // labelText: "Type here:   ",
                        hintText: "Type your entry here:",
                        //border: InputBorder.none //OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      controller: model.controller,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
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
