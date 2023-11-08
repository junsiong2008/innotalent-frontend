import 'package:devhack_2023/models/talent_stat.dart';
import 'package:flutter/material.dart';
import 'package:devhack_2023/pages/report/report_page.dart';

class Dashboard extends StatelessWidget {
  Dashboard({
    super.key,
    required this.talentStat,
  });

  final TalentStat talentStat;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: ReportPage(
                scaffoldKey: _scaffoldKey,
                talentStat: talentStat,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
