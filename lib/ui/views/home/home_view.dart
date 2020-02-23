import 'package:flutter/material.dart';
import 'package:lean_provider/core/enums/view_state.dart';
import 'package:lean_provider/core/ui_models/views/home/home_model.dart';
import 'package:lean_provider/ui/views/base_view.dart';
import 'package:lean_provider/ui/widgets/column_builder.dart';
import 'package:lean_provider/ui/widgets/custom_card.dart';
import 'package:lean_provider/ui/widgets/entry_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: model.hello,
        ),
        body: Center(
          child: (model.state == ViewState.Busy)
              ? Container()
              : ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomCard(
                        child: Container(
                          height: 150,
                          child: Center(
                            child: Text(
                              "${model.entries.length} entries",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CustomCard(
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Center(child: Text("50 Pos")),
                          ),
                        ),
                        CustomCard(
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Center(child: Text("70 Neg")),
                          ),
                        ),
                      ],
                    ),
                    Text("Recent"),
                    ColumnBuilder(
                      itemCount: model.entries.length,
                      itemBuilder: (context, index) {
                        return EntryTile(entry: model.entries[index]);
                      },
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
