import 'package:json_annotation/json_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorModel {
  String? name;
  String? gender;
  String? age;
  String? category;
  String? specialization;
  String? phoneNumber;
  bool? isVerified;
  String? address;
  String? lat;
  String? lng;
  String? email;
  String? image;
  DoctorModel({this.name, this.gender, this.age, this.category,
    this.phoneNumber,this.specialization, this.isVerified,
  this.address, this.lat, this.lng, this.email, this.image});

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}
