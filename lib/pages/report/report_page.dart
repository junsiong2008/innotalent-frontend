import 'package:devhack_2023/models/talent_stat.dart';
import 'package:devhack_2023/pages/report/widgets/talent_graph_card.dart';
import 'package:flutter/material.dart';
import 'package:devhack_2023/pages/report/widgets/header_widget.dart';
import 'package:devhack_2023/widgets/responsive.dart';
import 'package:devhack_2023/pages/report/widgets/talent_summary_card.dart';

class ReportPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final TalentStat talentStat;

  const ReportPage({
    super.key,
    required this.scaffoldKey,
    required this.talentStat,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context) ? 15 : 18,
          ),
          child: Column(
            children: [
              SizedBox(
                height: Responsive.isMobile(context) ? 5 : 18,
              ),
              Header(
                scaffoldKey: scaffoldKey,
                roleId: talentStat.preRating.roleId,
              ),
              _height(context),
              TalentGraphCard(
                talentStat: talentStat,
              ),
              _height(context),
              TalentSummaryCard(
                preGrade: talentStat.preGrade,
                prePerformance: talentStat.prePerformance.round().toString(),
                preSalary: talentStat.preSalary.round().toString(),
                nextInterviewPercentage:
                    talentStat.nextInterviewPercentage.round().toString(),
                probabilityLeavingFirstYear: talentStat
                    .preResignationNextFiveYears[0]
                    .round()
                    .toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _height(BuildContext context) => SizedBox(
        height: Responsive.isDesktop(context) ? 30 : 20,
      );
}
