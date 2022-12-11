import 'package:verinvest_mobile/features/profile/profile.dart';

class Profile {
  String first_name;
  String last_name;
  String email;
  String? birth_date;
  String? occupation;

  Profile(
    this.first_name,
    this.last_name,
    this.email,
    this.birth_date,
    this.occupation,
  );

  factory Profile.fromMap(Map<String, dynamic> map) => Profile(
        map["first_name"],
        map["last_name"],
        map["email"],
        map["birth_date"],
        map["occupation"],
      );
}

class ProfileData {
  String model;
  int pk;
  Profile fields;

  ProfileData({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory ProfileData.fromMap(Map<String, dynamic> map) => ProfileData(
        model: map['model'],
        pk: map["pk"],
        fields: Profile.fromMap(map["fields"]),
      );
}
