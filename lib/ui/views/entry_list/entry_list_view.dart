import 'package:flutter/material.dart';
import 'package:lean_provider/core/enums/view_state.dart';
import 'package:lean_provider/core/model/entry.dart';
import 'package:lean_provider/core/ui_models/views/entry_list/entry_list_model.dart';
import 'package:lean_provider/ui/views/base_view.dart';
import 'package:lean_provider/ui/widgets/entry_tile.dart';

class EntryListView extends StatelessWidget {
  final List<Entry> entries;
  const EntryListView({Key key, this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<EntryListModel>(
      onModelReady: (model) => model.init(entries),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Entries"),
        ),
        body: Center(
            child: (model.state == ViewState.Busy)
                ? Container()
                : ListView.builder(
                    itemCount: model.entries.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 16,
                          right: 16,
                        ),
                        child: EntryTile(
                          entry: model.entries[index],
                          key: UniqueKey(),
                        ),
                      );
                    },
                  )),
      ),
    );
  }
}
