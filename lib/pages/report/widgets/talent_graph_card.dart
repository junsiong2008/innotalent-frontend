import 'package:devhack_2023/const.dart';
import 'package:devhack_2023/pages/report/widgets/resignation_probability_line_graph.dart';
import 'package:devhack_2023/pages/report/widgets/return_bar_chart_card.dart';
import 'package:devhack_2023/pages/report/widgets/rating_spider_chart_card.dart';
import 'package:devhack_2023/responsive.dart';
import 'package:devhack_2023/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class TalentGraphCard extends StatelessWidget {
  const TalentGraphCard({super.key});

  @override
  Widget build(BuildContext context) {
    const Color negative = Color(0XFFDFA9B0);
    const Color positive = Color(primaryColorCode);

    return GridView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 1 : 3,
          crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
          mainAxisSpacing: 12.0,
          childAspectRatio: Responsive.isMobile(context) ? 16 / 9 : 3 / 2),
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
        CustomCard(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Annual Return Rate Prediction',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Expanded(
                child: ReturnBarChartCard(),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            color: negative,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Cost (Salary)',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[400],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: 10,
                            height: 10,
                            color: positive,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Return (Value Creation)',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ResignationProbablityLineGraph(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
