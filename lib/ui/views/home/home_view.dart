import 'package:auto_size_text/auto_size_text.dart';
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
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: model.viewAllEntries,
                        child: CustomCard(
                          child: Container(
                            height: 150,
                            child: Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    AutoSizeText(
                                      "${model.allEntries.length}",
                                      style: TextStyle(fontSize: 60),
                                    ),
                                    Text(
                                      "Entries",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    )
                                  ]),
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
                              width: MediaQuery.of(context).size.width / 2 - 32,
                              child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      AutoSizeText(
                                        "${model.positiveEntries.length}",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      Text(
                                        "Positive",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: model.viewNegativeEntries,
                          child: CustomCard(
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width / 2 - 32,
                              child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      AutoSizeText(
                                        "${model.negativeEntries.length}",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      Text(
                                        "Negative",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 32.0, left: 16, bottom: 16),
                      child: Text(
                        "Recent",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ColumnBuilder(
                        itemCount: model.recentEntries.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: EntryTile(
                              entry: model.recentEntries[index],
                              key: UniqueKey(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
