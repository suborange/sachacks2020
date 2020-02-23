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
    var data7 = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
    var data30 = [0.0, 0.8, 1.1, 1.0, 0.0, 0.4, -0.7, -2.0, -0.3, 0.0, 0.0];
    return BaseView<SettingsModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
          body: Column(
        children: <Widget>[
          Container(
            child: SfRadialGauge(
              title: GaugeTitle(
                  text: 'Average Mood',
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              axes: <RadialAxis>[
                RadialAxis(
                    minimum: 0,
                    maximum: 100,
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
                        startValue: 18,
                        endValue: 82,
                        color: Colors.red,
                        startWidth: 22,
                        endWidth: 22,
                        gradient: SweepGradient(
                            colors: const <Color>[Colors.red, Colors.blue],
                            stops: const <double>[0, 1]),
                      ),
                    ])
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: CustomCard(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                child: Sparkline(
                  data: data7,
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
                  data: data30,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
