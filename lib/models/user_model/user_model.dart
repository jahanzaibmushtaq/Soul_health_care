import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? name;
  String? gender;
  String? age;
  String? category;
  String? phoneNumber;
  UserModel({this.name, this.gender, this.age, this.category, this.phoneNumber});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
