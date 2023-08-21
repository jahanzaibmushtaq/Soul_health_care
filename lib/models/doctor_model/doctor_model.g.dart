// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      age: json['age'] as String?,
      category: json['category'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      specialization: json['specialization'] as String?,
      isVerified: json['isVerified'] as bool?,
      address: json['address'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'age': instance.age,
      'category': instance.category,
      'specialization': instance.specialization,
      'phoneNumber': instance.phoneNumber,
      'isVerified': instance.isVerified,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'email': instance.email,
      'image': instance.image,
    };
