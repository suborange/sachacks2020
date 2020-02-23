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
                      child: GestureDetector(
                        onTap: model.viewAllEntries,
                        child: CustomCard(
                          child: Container(
                            height: 150,
                            child: Center(
                              child: Text(
                                "${model.allEntries.length} entries",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: model.viewPositiveEntries,
                          child: CustomCard(
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Center(
                                  child: Text(
                                      "${model.positiveEntries.length} Pos")),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: model.viewNegativeEntries,
                          child: CustomCard(
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Center(
                                  child: Text(
                                      "${model.negativeEntries.length} Neg")),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Recent",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    ColumnBuilder(
                      itemCount: model.recentEntries.length,
                      itemBuilder: (context, index) {
                        return EntryTile(
                          entry: model.recentEntries[index],
                          key: UniqueKey(),
                        );
                      },
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
