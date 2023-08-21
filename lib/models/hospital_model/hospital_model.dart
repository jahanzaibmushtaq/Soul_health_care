import 'package:json_annotation/json_annotation.dart';

part 'hospital_model.g.dart';

@JsonSerializable()
class HospitalModel {
  String? name;
  String? gender;
  String? age;
  String? category;
  String? phoneNumber;
  String? address;
  bool? isVerified;
  String? lat;
  String? lng;
  HospitalModel({this.name, this.gender, this.age, this.category, this.phoneNumber,
    this.address,this.isVerified, this.lng, this.lat});

  factory HospitalModel.fromJson(Map<String, dynamic> json) =>
      _$HospitalModelFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalModelToJson(this);
}
