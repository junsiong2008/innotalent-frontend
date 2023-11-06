import 'package:flutter/material.dart';

class TalentMetricModel {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String title;
  const TalentMetricModel({
    required this.icon,
    required this.value,
    required this.title,
    required this.iconColor,
  });
}
