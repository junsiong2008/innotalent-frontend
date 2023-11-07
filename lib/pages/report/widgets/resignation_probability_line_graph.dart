import 'package:collection/collection.dart';
import 'package:devhack_2023/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ResignationProbablityLineGraph extends StatelessWidget {
  ResignationProbablityLineGraph({
    super.key,
    required this.fiveYearsResignationProbability,
  });

  final List<double> fiveYearsResignationProbability;

  final bottomTitle = {
    0: '2024',
    10: '2025',
    20: '2026',
    30: '2027',
    40: '2028',
  };

  final leftTitle = {
    0: '0',
    20: '20',
    40: '40',
    60: '60',
    80: '80',
    100: '100'
  };

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          handleBuiltInTouches: true,
        ),
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey.withOpacity(0.1),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              interval: 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                return bottomTitle[value.toInt()] != null
                    ? SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 10,
                        child: Text(bottomTitle[value.toInt()].toString(),
                            style: TextStyle(
                                fontSize: Responsive.isMobile(context) ? 9 : 12,
                                color: Colors.grey[400])),
                      )
                    : const SizedBox();
              },
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              getTitlesWidget: (double value, TitleMeta meta) {
                return leftTitle[value.toInt()] != null
                    ? Text(leftTitle[value.toInt()].toString(),
                        style: TextStyle(
                            fontSize: Responsive.isMobile(context) ? 9 : 12,
                            color: Colors.grey[400]))
                    : const SizedBox();
              },
              showTitles: true,
              interval: 1,
              reservedSize: 40,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            curveSmoothness: 0,
            color: Theme.of(context).primaryColor,
            barWidth: 2.5,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.5),
                  Colors.transparent
                ],
              ),
              show: true,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
            dotData: FlDotData(show: false),
            spots: fiveYearsResignationProbability
                .mapIndexed(
                  (idx, e) => FlSpot(idx * 10, e),
                )
                .toList(),
          )
        ],
        minX: 0,
        maxX: 40,
        maxY: 105,
        minY: -5,
      ),
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }
}
