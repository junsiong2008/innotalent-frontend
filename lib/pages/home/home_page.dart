// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:devhack_2023/pages/home/widgets/talent_graph_card.dart';
import 'package:flutter/material.dart';
import 'package:devhack_2023/pages/home/widgets/header_widget.dart';
import 'package:devhack_2023/responsive.dart';
import 'package:devhack_2023/pages/home/widgets/talent_summary_card.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomePage({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    SizedBox _height(BuildContext context) => SizedBox(
          height: Responsive.isDesktop(context) ? 30 : 20,
        );

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 15 : 18),
          child: Column(
            children: [
              SizedBox(
                height: Responsive.isMobile(context) ? 5 : 18,
              ),
              Header(scaffoldKey: scaffoldKey),
              _height(context),
              const TalentSummaryCard(),
              _height(context),
              const TalentGraphCard(),
              // _height(context),
              // const SpiderChartCard(),
              // LineChartCard(),
              // _height(context),
              // BarChartCard(),
              // _height(context),
            ],
          ),
        ),
      ),
    );
  }
}
