import 'package:devhack_2023/pages/home/widgets/resignation_probability_line_graph.dart';
import 'package:devhack_2023/pages/home/widgets/return_bar_chart_card.dart';
import 'package:devhack_2023/pages/home/widgets/rating_spider_chart_card.dart';
import 'package:devhack_2023/responsive.dart';
import 'package:devhack_2023/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class TalentGraphCard extends StatelessWidget {
  const TalentGraphCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 1 : 3,
          crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
          mainAxisSpacing: 12.0,
          childAspectRatio: Responsive.isMobile(context) ? 16 / 9 : 5 / 4),
      children: [
        const CustomCard(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Overall Rating Prediction',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: RatingSpiderChartCard(),
              ),
            ],
          ),
        ),
        const CustomCard(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Annual Return Rate Prediction',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: ReturnBarChartCard(),
              ),
            ],
          ),
        ),
        CustomCard(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Resignation Intention Prediction',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: ResignationProbablityLineGraph(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
