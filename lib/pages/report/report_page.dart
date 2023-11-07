import 'package:devhack_2023/pages/report/widgets/talent_graph_card.dart';
import 'package:flutter/material.dart';
import 'package:devhack_2023/pages/report/widgets/header_widget.dart';
import 'package:devhack_2023/responsive.dart';
import 'package:devhack_2023/pages/report/widgets/talent_summary_card.dart';

class ReportPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ReportPage({super.key, required this.scaffoldKey});

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
              Header(scaffoldKey: scaffoldKey),
              _height(context),
              const TalentGraphCard(),
              _height(context),
              const TalentSummaryCard(),
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
