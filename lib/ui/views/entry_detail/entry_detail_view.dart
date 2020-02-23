import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lean_provider/core/model/entry.dart';
import 'package:lean_provider/core/ui_models/entry_tile_model.dart';
import 'package:lean_provider/core/ui_models/views/entry_detail/entry_detail_model.dart';
import 'package:lean_provider/ui/views/base_view.dart';
import 'package:lean_provider/ui/widgets/custom_card.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class EntryDetailView extends StatelessWidget {
  final Entry entry;

  const EntryDetailView({Key key, this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<EntryDetailModel>(
      onModelReady: (model) => model.init(entry),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            DateFormat("M/d/y").format(entry.date),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width * 0.9,
                      lineHeight: 14.0,
                      percent: (model.entry.positivity + 1) / 2,
                      backgroundColor: Colors.grey,
                      progressColor: (model.entry.positivity.isNegative)
                          ? Colors.red
                          : (model.entry.positivity > 0.6)
                              ? Colors.green
                              : Colors.blue,
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  model.entry.text,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
