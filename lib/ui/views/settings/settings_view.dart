import 'package:flutter/material.dart';
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
          body: ListView(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
            child: CustomCard(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.5,
                  child: Container(
                    child: SfRadialGauge(
                      title: GaugeTitle(
                          text: 'Average Mood',
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: CustomCard(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Last",
                          ),
                          Text(
                            "7",
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            "Entries",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Sparkline(
                        lineColor: Colors.grey,
                        data: model.sevenData,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: CustomCard(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Last",
                          ),
                          Text(
                            "30",
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            "Entries",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Sparkline(
                        lineColor: Colors.grey,
                        data: model.thirtyData,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
