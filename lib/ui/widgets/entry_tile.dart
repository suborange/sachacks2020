import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lean_provider/core/model/entry.dart';
import 'package:lean_provider/core/ui_models/entry_tile_model.dart';
import 'package:lean_provider/ui/views/base_view.dart';
import 'package:lean_provider/ui/widgets/custom_card.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
          child: GestureDetector(
            onTap: model.viewDetails,
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
                            child: LinearPercentIndicator(
                              width: 140.0,
                              lineHeight: 14.0,
                              percent: (model.entry.positivity + 1) / 2,
                              backgroundColor: Colors.grey,
                              progressColor: (model.entry.positivity.isNegative)
                                  ? Colors.red
                                  : (model.entry.positivity > 0.6)
                                      ? Colors.green
                                      : Colors.blue,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
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
          ),
          actions: <Widget>[],
          secondaryActions: <Widget>[
            IconSlideAction(
              color: Colors.transparent,
              onTap: () {},
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
