import 'package:auto_size_text/auto_size_text.dart';
import 'package:devhack_2023/responsive.dart';
import 'package:devhack_2023/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class TalentMetricCard extends StatelessWidget {
  TalentMetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    this.unit,
    this.currency,
  });

  final String title;
  final String value;
  final String? unit;
  final String? currency;
  final IconData icon;
  final Color iconColor;

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xff0061ff), Color(0xff60efff)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                if (currency != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        currency!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: Responsive.isDesktop(context)
                        ? 120
                        : Responsive.isTablet(context)
                            ? 36
                            : 24,
                    // color: Colors.white,
                    foreground: Paint()..shader = linearGradient,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (unit != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 2),
                      Text(
                        unit!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              const SizedBox(width: 8),
              AutoSizeText(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
