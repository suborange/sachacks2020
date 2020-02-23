import 'package:flutter/material.dart';
import 'package:lean_provider/core/enums/view_state.dart';
import 'package:lean_provider/core/ui_models/views/settings/settings_model.dart';
import 'package:lean_provider/ui/views/base_view.dart';
import 'package:lean_provider/ui/widgets/custom_card.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
          body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 0.5,
              child: Container(
                child: SfRadialGauge(
                  title: GaugeTitle(
                      text: 'Average Mood',
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  axes: <RadialAxis>[
                    RadialAxis(
                        startAngle: 180,
                        endAngle: 0,
                        minimum: 0,
                        maximum: 100,
                        interval: 10,
                        showTicks: false,
                        showAxisLine: false,
                        showLabels: false,
                        pointers: <GaugePointer>[
                          MarkerPointer(
                              value: model.adjustedAvg,
                              markerOffset: -5,
                              color: Colors.blue)
                        ],
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 0,
                            endValue: 100,
                            color: Colors.red,
                            startWidth: 50,
                            endWidth: 50,
                            gradient: SweepGradient(colors: <Color>[
                              Colors.red,
                              Theme.of(context).primaryColor
                            ], stops: <double>[
                              0,
                              1
                            ]),
                          ),
                        ])
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: CustomCard(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                child: Sparkline(
                  data: model.sevenData,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: CustomCard(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                child: Sparkline(
                  data: model.thirtyData,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
