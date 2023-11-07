import 'package:devhack_2023/models/pre_rating.dart';

class TalentStat {
  final PreRating preRating;
  final int prePerformance;
  final String preGrade;
  final double preSalary;
  final List<double> preSalaryNextFiveYears;
  final List<double> preReturnNextFiveYears;
  final List<double> preResignationNextFiveYears;
  final double nextInterviewPercentage;

  TalentStat({
    required this.preRating,
    required this.prePerformance,
    required this.preGrade,
    required this.preSalary,
    required this.preSalaryNextFiveYears,
    required this.preReturnNextFiveYears,
    required this.nextInterviewPercentage,
    required this.preResignationNextFiveYears,
  });

  factory TalentStat.fromJson(Map<String, dynamic> json) =>
      _talentStatFromJson(json);
}

TalentStat _talentStatFromJson(Map<String, dynamic> json) => TalentStat(
      preRating: PreRating.fromJson(json['pre_rating']),
      prePerformance: json['pre_performance'],
      preGrade: json['pre_grade'],
      preSalary: json['pre_salary'].toDouble(),
      preSalaryNextFiveYears: (json['pre_salary_next_five_years'] as List)
          .map((e) => e as double)
          .toList(),
      preReturnNextFiveYears: (json['pre_return_next_five_years'] as List)
          .map((e) => e as double)
          .toList(),
      preResignationNextFiveYears:
          (json['pre_resignation_next_five_years'] as List)
              .map((e) => e as double)
              .toList(),
      nextInterviewPercentage: json['next_interview_percentage'].toDouble(),
    );
