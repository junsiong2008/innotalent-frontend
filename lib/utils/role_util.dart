class RoleUtil {
  static const List<String> roles = <String>[
    'Accountant',
    'Actuary',
    'AI',
    'Assembler',
    'Auditor',
    'Brand Specialist',
    'Cloud Solutions Architect',
    'Content Marketing',
    'Credit Analyst',
    'Cybersecurity Specialist',
  ];
  static String getRoleById(int roleId) {
    return roles[roleId];
  }
}
