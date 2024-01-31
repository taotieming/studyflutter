class User {
  final String? RealName;
  final String? School;
  final String? Academy;
  final String? Major;
  final String? SchoolClass;
  final String? StudentID;
  final String? Gender;
  final String? Tel;
  final String? Password;

  User(this.RealName, this.School, this.Academy, this.Major, this.SchoolClass,
      this.StudentID, this.Gender, this.Tel, this.Password);

  factory User.fromJson(Map<String, dynamic> json) => User(
      json['RealName'],
      json['School'],
      json['Academy'],
      json['Major'],
      json['choolClass'],
      json['StudentID'],
      json['Gender'],
      json['Tel'],
      json['Password']);
}
