import 'package:devhack_2023/const.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReturnBarChartCard extends StatelessWidget {
  const ReturnBarChartCard({super.key});

  final Color dark = const Color(0XFFDFA9B0);
  final Color light = const Color(primaryColorCode);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final barsSpace = 18.0 * constraints.maxWidth / 400;
      final barsWidth = 36.0 * constraints.maxWidth / 400;

      return BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          barTouchData: BarTouchData(
            enabled: false,
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: bottomTitles,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: leftTitles,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: FlGridData(
            show: true,
            checkToShowHorizontalLine: (value) => value % 10 == 0,
            getDrawingHorizontalLine: (value) => FlLine(
              color: const Color(primaryColorCode).withOpacity(0.1),
              strokeWidth: 1,
            ),
            drawVerticalLine: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
          groupsSpace: barsSpace,
          barGroups: getData(barsWidth, barsSpace),
        ),
      );
    });
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '2024';
        break;
      case 1:
        text = '2025';
        break;
      case 2:
        text = '2026';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max + 1) {
      return Container();
    }
    const style = TextStyle(
      fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 100,
            rodStackItems: [
              BarChartRodStackItem(0, 50, dark),
              BarChartRodStackItem(50, 100, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 100,
            rodStackItems: [
              BarChartRodStackItem(0, 30, dark),
              BarChartRodStackItem(30, 100, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 100,
            rodStackItems: [
              BarChartRodStackItem(0, 20, dark),
              BarChartRodStackItem(20, 100, light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
    ];
  }
}
