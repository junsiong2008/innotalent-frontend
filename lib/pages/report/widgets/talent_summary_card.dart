import 'package:flutter/material.dart';
import 'package:devhack_2023/pages/report/widgets/talent_metric_card.dart';
import 'package:devhack_2023/Responsive.dart';
import 'package:devhack_2023/models/talent_metric_model.dart';

class TalentSummaryCard extends StatelessWidget {
  const TalentSummaryCard({super.key});

  final List<TalentMetricModel> talentMetrics = const [
    TalentMetricModel(
      icon: Icons.speed_outlined,
      iconColor: Colors.red,
      value: "B+",
      title: "Overall Rating",
    ),
    TalentMetricModel(
      icon: Icons.trending_up,
      iconColor: Colors.orange,
      value: "90",
      title: "Performance Prediction",
    ),
    TalentMetricModel(
      icon: Icons.account_balance_wallet_outlined,
      iconColor: Colors.green,
      value: "RM 3500",
      title: "Recommended Salary",
    ),
    TalentMetricModel(
      icon: Icons.group_outlined,
      iconColor: Colors.blue,
      value: "80%",
      title: "Recommended for Interview",
    ),
    TalentMetricModel(
      icon: Icons.door_back_door_outlined,
      iconColor: Colors.amberAccent,
      value: "20%",
      title: "Probability of Leaving in 1st Year",
    ),
  ];

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
          value: 'B+',
          icon: Icons.speed_outlined,
          iconColor: Colors.red,
        ),
        TalentMetricCard(
          title: 'Performance Prediction',
          value: '75',
          unit: '%',
          icon: Icons.trending_up,
          iconColor: Colors.orange,
        ),
        TalentMetricCard(
          title: "Recommended Salary",
          currency: 'RM',
          value: "3500",
          icon: Icons.account_balance_wallet_outlined,
          iconColor: Colors.green,
        ),
        TalentMetricCard(
          icon: Icons.group_outlined,
          iconColor: Colors.blue,
          value: '80',
          unit: '%',
          title: 'Recommended for Interview',
        ),
        TalentMetricCard(
          title: 'Probability of Leaving in 1st Year',
          value: '10',
          unit: '%',
          icon: Icons.door_back_door_outlined,
          iconColor: Colors.amberAccent,
        )
      ],
    );
  }
}
