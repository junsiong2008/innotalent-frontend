import 'package:flutter/material.dart';
import 'package:devhack_2023/Responsive.dart';
import 'package:devhack_2023/model/health_model.dart';
import 'package:devhack_2023/widgets/custom_card.dart';

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
    return GridView.builder(
      itemCount: talentMetrics.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
          mainAxisSpacing: 12.0),
      itemBuilder: (context, i) {
        return CustomCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                talentMetrics[i].icon,
                color: talentMetrics[i].iconColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 4),
                child: Text(
                  talentMetrics[i].value,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                talentMetrics[i].title,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
