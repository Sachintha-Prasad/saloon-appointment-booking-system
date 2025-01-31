import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saloon_appointment_booking_system/utils/constants/enum.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String mobileNo;
  final String password;
  final String? profileImg;
  final Roles role;

  UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.mobileNo,
    this.profileImg,
    required this.role
  });

  // convert UserModel to JSON for Firestore or other uses
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "mobile_no": mobileNo,
      "profile_img": profileImg,
      "role": role,
    };
  }

  /// map firestore document snapshot to UserModel
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    return UserModel(
      id: document.id,
      email: data?["email"],
      password: data?["password"],
      name: data?["name"],
      mobileNo: data?["mobile_no"],
      profileImg: data?["profile_img"],
      role: data?["role"]
    );
  }
}
