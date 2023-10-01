class User {
  final String email;
  final String name;
  final String age;
  final String gender;
  final String address;
  final String ecName1;
  final String ecNumber1;
  final String ecName2;
  final String ecNumber2;
  final List allergies;
  final List medications;
  final List medicalConditions;

  User({
    required this.email,
    required this.name,
    required this.age,
    required this.gender,
    required this.address,
    required this.ecName1,
    required this.ecName2,
    required this.ecNumber1,
    required this.ecNumber2,
    required this.allergies,
    required this.medications,
    required this.medicalConditions,
  });
}
