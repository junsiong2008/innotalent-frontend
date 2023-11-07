import 'package:devhack_2023/const.dart';
import 'package:devhack_2023/models/pre_rating.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RatingSpiderChartCard extends StatelessWidget {
  const RatingSpiderChartCard({
    super.key,
    required this.preRating,
  });

  final PreRating preRating;

  @override
  Widget build(BuildContext context) {
    return RadarChart(
      RadarChartData(
        radarTouchData: RadarTouchData(),
        dataSets: [
          RadarDataSet(
            fillColor: metricColor.withOpacity(0.25),
            borderColor: metricColor.withOpacity(0.5),
            entryRadius: 2,
            dataEntries: [
              RadarEntry(
                value: preRating.skillSet.toDouble(),
              ),
              RadarEntry(
                value: preRating.development.toDouble(),
              ),
              RadarEntry(
                value: preRating.culture.toDouble(),
              ),
              RadarEntry(
                value: preRating.outstanding.toDouble(),
              ),
              RadarEntry(
                value: preRating.attitude.toDouble(),
              )
            ],
            borderWidth: 2,
          )
        ],
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
}

final gridColor = Colors.grey[400];
final titleColor = Colors.grey[400];
const metricColor = Color(primaryColorCode);
