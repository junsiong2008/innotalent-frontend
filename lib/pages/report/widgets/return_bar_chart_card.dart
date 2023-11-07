import 'package:collection/collection.dart';
import 'package:devhack_2023/const.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReturnBarChartCard extends StatelessWidget {
  const ReturnBarChartCard({
    super.key,
    required this.fiveYearsCost,
    required this.fiveYearsReturn,
  });

  final List<double> fiveYearsCost;
  final List<double> fiveYearsReturn;

  final Color negative = const Color(0XFFDFA9B0);
  final Color positive = const Color(primaryColorCode);

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
          barGroups: getBarChartData(
            barsWidth: barsWidth,
            barsSpace: barsSpace,
            fiveYearsCost: fiveYearsCost,
            fiveYearsReturn: fiveYearsReturn,
          ),
        ),
      );
    });
  }

  Widget bottomTitles(double value, TitleMeta meta) {
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
      case 3:
        text = '2027';
        break;
      case 4:
        text = '2028';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max + 1) {
      return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: TextStyle(
          fontSize: 10,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  List<BarChartGroupData> getBarChartData({
    required double barsWidth,
    required barsSpace,
    required List<double> fiveYearsCost,
    required List<double> fiveYearsReturn,
  }) {
    return fiveYearsCost.mapIndexed((index, element) {
      final costToY = (element / (fiveYearsReturn[index] + element)) * 100;
      return BarChartGroupData(
        x: index,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 100,
            rodStackItems: [
              BarChartRodStackItem(0, costToY, negative),
              BarChartRodStackItem(costToY, 100, positive),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      );
    }).toList();
  }
}
