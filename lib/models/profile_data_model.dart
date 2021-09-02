enum Gender { MALE, FEMALE }

class ProfileDataModel {
  final Gender gender;
  final String emaildId;
  final String name;
  final String imagePath;

  ProfileDataModel({
    required this.gender,
    required this.emaildId,
    required this.name,
    required this.imagePath,
  });
}
