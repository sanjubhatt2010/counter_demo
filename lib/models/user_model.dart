import 'package:counter_app/helpers/extension.dart';

class UserModel {
  final String userId;
  final String email;
  final String name;
  final String? profileImage;
  final String? phoneMumber;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    this.profileImage,
    this.phoneMumber,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        userId: json['userId'],
        email: json['email'],
        name: json['name'],
        profileImage: json['profileImage'],
        phoneMumber: json['phoneMumber'],
      );
      
  Map<String, dynamic> toMap() {
    Map<String, dynamic> userMap = {
      'userId': userId,
      'email': email,
      'name': name,
    };
    if (!profileImage.isNullOrEmpty) {
      userMap['profileImage'] = profileImage;
    }
    if (!phoneMumber.isNullOrEmpty) {
      userMap['phoneMumber'] = phoneMumber;
    }
    return userMap;
  }
}
