import 'package:devhack_2023/const.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RatingSpiderChartCard extends StatelessWidget {
  const RatingSpiderChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return RadarChart(
      RadarChartData(
        radarTouchData: RadarTouchData(),
        dataSets: showingDataSets(),
        radarBackgroundColor: Colors.transparent,
        borderData: FlBorderData(show: false),
        radarBorderData: const BorderSide(color: Colors.transparent),
        titlePositionPercentageOffset: 0.2,
        titleTextStyle: TextStyle(color: titleColor, fontSize: 14),
        getTitle: (index, angle) {
          switch (index) {
            case 0:
              return const RadarChartTitle(
                text: 'Skill Set',
              );

            case 1:
              return const RadarChartTitle(
                text: 'Development',
              );

            case 2:
              return const RadarChartTitle(
                text: 'Culture',
              );

            case 3:
              return const RadarChartTitle(
                text: 'Outstanding',
              );

            case 4:
              return const RadarChartTitle(
                text: 'Attitude',
              );

            default:
              return const RadarChartTitle(text: '');
          }
        },
        tickCount: 1,
        ticksTextStyle:
            const TextStyle(color: Colors.transparent, fontSize: 10),
        tickBorderData: const BorderSide(color: Colors.transparent),
        gridBorderData: BorderSide(color: gridColor!, width: 2),
      ),
      swapAnimationDuration: const Duration(milliseconds: 400),
    );
  }

  List<RadarDataSet> showingDataSets() {
    return rawDataSets().asMap().entries.map((entry) {
      final rawDataSet = entry.value;

      return RadarDataSet(
        fillColor: rawDataSet.color.withOpacity(0.25),
        borderColor: rawDataSet.color.withOpacity(0.5),
        entryRadius: 2,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: 2,
      );
    }).toList();
  }

  List<RawDataSet> rawDataSets() {
    return [
      RawDataSet(
        title: 'Fashion',
        color: fashionColor,
        values: [
          5,
          4,
          3,
          4,
          5,
        ],
      ),
    ];
  }
}

class RawDataSet {
  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });

  final String title;
  final Color color;
  final List<double> values;
}

final gridColor = Colors.grey[400];
final titleColor = Colors.grey[400];
const fashionColor = Color(primaryColorCode);
