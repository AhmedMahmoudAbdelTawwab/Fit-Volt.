class UserProfileSetupDataEntitty {
  UserProfileSetupDataEntitty({
    this.gender = '',
    this.topGoal = '',
    this.tranningLevel = '',
    this.weight = 0.0,
    this.height = 0.0,
    required this.dateOfBirth,
  });
  final String gender;
  final String topGoal;
  final String tranningLevel;
  final double weight;
  final double height;
  final DateTime dateOfBirth;
}
