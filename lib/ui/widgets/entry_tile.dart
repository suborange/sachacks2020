import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lean_provider/core/model/entry.dart';
import 'package:lean_provider/core/ui_models/entry_tile_model.dart';
import 'package:lean_provider/ui/views/base_view.dart';
import 'package:lean_provider/ui/widgets/custom_card.dart';

class EntryTile extends StatelessWidget {
  final Entry entry;

  const EntryTile({Key key, this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<EntryTileModel>(
      onModelReady: (model) => model.init(entry, key),
      builder: (context, model, child) => Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          child: Container(
            height: 150,
            width: double.infinity,
            child: CustomCard(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: Text(
                            model.entry.positivity.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            maxLines: 1,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AutoSizeText(
                      model.entry.text,
                      overflow: TextOverflow.ellipsis,
                      // minFontSize: 10,
                      maxLines: 2,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          DateFormat("M/d/y").format(entry.date),
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: <Widget>[],
          secondaryActions: <Widget>[
            IconSlideAction(
              color: Colors.transparent,
              iconWidget: Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  height: 64,
                  width: 64,
                  child: CustomCard(
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    // color: kDeleteBookColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
