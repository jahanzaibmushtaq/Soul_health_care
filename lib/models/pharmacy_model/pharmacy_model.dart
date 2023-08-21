import 'package:json_annotation/json_annotation.dart';

part 'pharmacy_model.g.dart';

@JsonSerializable()
class PharmacyModel {
  String? name;
  String? gender;
  String? age;
  String? category;
  String? phoneNumber;
  String? address;
  bool? isVerified;
  String? lat;
  String? lng;
  PharmacyModel({this.name, this.gender, this.age, this.category,
    this.phoneNumber, this.address,this.isVerified, this.lat, this.lng});

  factory PharmacyModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyModelToJson(this);
}
