import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TsumitabeChartComponent extends StatefulWidget {
  const TsumitabeChartComponent({Key? key}) : super(key: key);

  @override
  _TsumitabeChartComponentState createState() =>
      _TsumitabeChartComponentState();
}

class _TsumitabeChartComponentState extends State<TsumitabeChartComponent> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: BarChart(
                BarChartData(
                    borderData: FlBorderData(
                        border: const Border(
                      top: BorderSide.none,
                      right: BorderSide.none,
                      left: BorderSide(width: 1),
                      bottom: BorderSide(width: 1),
                    )),
                    groupsSpace: 5,
                    barGroups: [
                      BarChartGroupData(x: 1, barRods: [
                        BarChartRodData(toY: 10, width: 15),
                      ]),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(toY: 9, width: 15),
                      ]),
                      BarChartGroupData(x: 3, barRods: [
                        BarChartRodData(toY: 4, width: 15),
                      ]),
                      BarChartGroupData(x: 4, barRods: [
                        BarChartRodData(toY: 2, width: 15),
                      ]),
                      BarChartGroupData(x: 5, barRods: [
                        BarChartRodData(toY: 13, width: 15),
                      ]),
                    ]),
              ),
            )));
  }
}
