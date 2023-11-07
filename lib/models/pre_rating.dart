class PreRating {
  final int roleId;
  final int skillSet;
  final int development;
  final int culture;
  final int outstanding;
  final int attitude;

  PreRating({
    required this.roleId,
    required this.skillSet,
    required this.development,
    required this.culture,
    required this.outstanding,
    required this.attitude,
  });

  factory PreRating.fromJson(Map<String, dynamic> json) =>
      _preRatingFromJson(json);
}

PreRating _preRatingFromJson(Map<String, dynamic> json) => PreRating(
      roleId: json['rold_id'],
      skillSet: json['skill_set'],
      development: json['development'],
      culture: json['culture'],
      outstanding: json['outstanding'],
      attitude: json['attitude'],
    );
