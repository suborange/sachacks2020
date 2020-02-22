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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
        body: Center(
          child: (model.state == ViewState.Busy)
              ? Container()
              : ListView(
                  children: <Widget>[
                    Card(
                      child: Container(
                        height: 150,
                        child: Center(
                          child: Text(
                            "125 entries",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Card(
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Center(child: Text("50 Pos")),
                          ),
                        ),
                        Card(
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Center(child: Text("70 Neg")),
                          ),
                        ),
                      ],
                    ),
                    Text("Recent"),
                    ListTile(
                      leading: Text("Entry 1"),
                    ),
                    ListTile(
                      leading: Text("Entry 1"),
                    ),
                    ListTile(
                      leading: Text("Entry 1"),
                    ),
                    ListTile(
                      leading: Text("Entry 1"),
                    ),
                    ListTile(
                      leading: Text("Entry 1"),
                    ),
                    ListTile(
                      leading: Text("Entry 1"),
                    ),
                    ListTile(
                      leading: Text("Entry 1"),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
