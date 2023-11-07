import 'package:flutter/material.dart';
import 'package:devhack_2023/pages/report/widgets/talent_metric_card.dart';
import 'package:devhack_2023/Responsive.dart';

class TalentSummaryCard extends StatelessWidget {
  const TalentSummaryCard({
    super.key,
    required this.preGrade,
    required this.prePerformance,
    required this.preSalary,
    required this.nextInterviewPercentage,
    required this.probabilityLeavingFirstYear,
  });

  final String preGrade;
  final String prePerformance;
  final String preSalary;
  final String nextInterviewPercentage;
  final String probabilityLeavingFirstYear;

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
        crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
        mainAxisSpacing: 12.0,
      ),
      children: [
        TalentMetricCard(
          title: 'Overall Rating',
          value: preGrade,
          icon: Icons.speed_outlined,
          iconColor: Colors.red,
        ),
        TalentMetricCard(
          title: 'Performance Prediction',
          value: prePerformance,
          unit: '%',
          icon: Icons.trending_up,
          iconColor: Colors.orange,
        ),
        TalentMetricCard(
          title: "Recommended Salary",
          currency: 'RM',
          value: preSalary,
          icon: Icons.account_balance_wallet_outlined,
          iconColor: Colors.green,
        ),
        TalentMetricCard(
          icon: Icons.group_outlined,
          iconColor: Colors.blue,
          value: nextInterviewPercentage,
          unit: '%',
          title: 'Recommended for Interview',
        ),
        TalentMetricCard(
          title: 'Probability of Leaving in 1st Year',
          value: probabilityLeavingFirstYear,
          unit: '%',
          icon: Icons.door_back_door_outlined,
          iconColor: Colors.amberAccent,
        )
      ],
    );
  }
}
