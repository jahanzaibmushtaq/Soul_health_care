// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      age: json['age'] as String?,
      category: json['category'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'age': instance.age,
      'category': instance.category,
      'phoneNumber': instance.phoneNumber,
    };
