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
    return Padding(
      padding: const EdgeInsets.all(15),
      child: BarChart(
        BarChartData(
            barTouchData: BarTouchData(
              enabled: false,
            ),
            borderData: FlBorderData(
              show: false,
            ),
            gridData: FlGridData(
              show: true,
              checkToShowHorizontalLine: (value) => value % 10 == 0,
              getDrawingHorizontalLine: (value) => FlLine(
                strokeWidth: 1,
              ),
              drawVerticalLine: false,
            ),
            barGroups: [
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(
                  toY: 10,
                  width: 25,
                  borderRadius: BorderRadius.zero,
                ),
              ]),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(
                  toY: 9,
                  width: 25,
                  borderRadius: BorderRadius.zero,
                ),
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(
                  toY: 4,
                  width: 25,
                  borderRadius: BorderRadius.zero,
                ),
              ]),
              BarChartGroupData(x: 4, barRods: [
                BarChartRodData(
                  toY: 2,
                  width: 25,
                  borderRadius: BorderRadius.zero,
                ),
              ]),
              BarChartGroupData(x: 5, barRods: [
                BarChartRodData(
                  toY: 13,
                  width: 25,
                  borderRadius: BorderRadius.zero,
                ),
              ]),
            ]),
      ),
    );
  }
}
