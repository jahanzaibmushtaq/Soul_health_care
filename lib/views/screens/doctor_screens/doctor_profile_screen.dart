import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/user_profile_controller.dart';
import 'package:random_video_chat_app/models/doctor_model/doctor_model.dart';
import 'package:random_video_chat_app/utils/app_imports.dart';
import 'package:random_video_chat_app/views/screens/sign_in_screen/widgets/custom_button.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({Key? key}) : super(key: key);

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  String? specialization;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserProfileController _userProfileController =
  Get.find<UserProfileController>();

  List<String> specializationCategories = [
    'Cardiology',
    'Dermatology',
    'Endocrinology',
    'Gastroenterology',
    'Hematology',
    'Neurology',
    'Ophthalmology',
    'Orthopedics',
    'Pediatrics',
    'Psychiatry',
  ];

  final OutlineInputBorder _outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
          color: Colors.blue, width: 5, style: BorderStyle.solid));
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),

                          //gender

                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey),
                            child: Obx(
                              () => ToggleButtons(
                                onPressed: (int index) =>
                                    _userProfileController
                                        .onSelectGender(index),
                                isSelected:
                                _userProfileController.selectedCategory,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                direction: Axis.horizontal,
                                selectedBorderColor: Colors.blue,
                                borderColor: Colors.blue,
                                fillColor: Colors.blue,
                                color: Colors.white.withOpacity(0.5),
                                selectedColor: Colors.white,
                                borderWidth: 3,
                                renderBorder: true,
                                constraints: BoxConstraints(
                                    maxWidth: Get.width * 0.25,
                                    maxHeight: 73.h,
                                    minHeight: 50.h,
                                    minWidth: Get.width * 0.1),
                                children:
                                _userProfileController.genderButtonWidget,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          //name

                          TextFormField(
                            textAlign: TextAlign.center,
                            controller:
                            _userProfileController.nameEditingController,
                            validator: (String? value) =>
                                _userProfileController.onValidate(value!),
                            decoration: InputDecoration(
                                filled: true,
                                alignLabelWithHint: true,
                                errorStyle: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.blue,
                                focusedBorder: _outlineBorder,
                                enabled: true,
                                prefixIcon: const ImageIcon(
                                  AssetImage(AppImages.nameIcon),
                                  color: Colors.white,
                                ),
                                enabledBorder: _outlineBorder,
                                hintText: "Name",
                                border: _outlineBorder),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          //age

                          TextFormField(
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            controller:
                            _userProfileController.ageEditingController,
                            validator: (String? value) =>
                                _userProfileController.onValidate(value!),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                errorStyle: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                                filled: true,
                                alignLabelWithHint: true,
                                hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.blue,
                                hintText: "Age",
                                focusedBorder: _outlineBorder,
                                enabled: true,
                                prefixIcon: const ImageIcon(
                                  AssetImage(AppImages.ageIcon),
                                  color: Colors.white,
                                ),
                                enabledBorder: _outlineBorder,
                                border: _outlineBorder),
                            maxLength: 2,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]")),
                            ],
                            keyboardType: TextInputType.number,
                          ),


                          const SizedBox(
                            height: 20,
                          ),

                          //phone number

                          TextFormField(
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            controller:
                            _userProfileController.phoneEditingController,
                            validator: (String? value) =>
                                _userProfileController.onValidate(value!),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                errorStyle: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                                filled: true,
                                alignLabelWithHint: true,
                                hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.blue,
                                hintText: "Phone number",
                                focusedBorder: _outlineBorder,
                                enabled: true,
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                enabledBorder: _outlineBorder,
                                border: _outlineBorder),
                            maxLength: 11,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]")),
                            ],
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          //address

                          TextFormField(
                            textAlign: TextAlign.center,
                            controller:
                            _userProfileController.addressEditingController,
                            validator: (String? value) =>
                                _userProfileController.onValidate(value!),
                            decoration: InputDecoration(
                                filled: true,
                                alignLabelWithHint: true,
                                errorStyle: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.blue,
                                focusedBorder: _outlineBorder,
                                enabled: true,
                                prefixIcon: const ImageIcon(
                                  AssetImage(AppImages.nameIcon),
                                  color: Colors.white,
                                ),
                                enabledBorder: _outlineBorder,
                                hintText: "Address",
                                border: _outlineBorder),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          //Enter Location Latitude
                          TextFormField(
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            controller:
                            _userProfileController.latitudeEditingController,
                            validator: (String? value) =>
                                _userProfileController.onValidate(value!),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                errorStyle: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                                filled: true,
                                alignLabelWithHint: true,
                                hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.blue,
                                hintText: "Enter Location Latitude",
                                focusedBorder: _outlineBorder,
                                enabled: true,
                                prefixIcon: const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                enabledBorder: _outlineBorder,
                                border: _outlineBorder),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'^-?(\d+(\.\d*)?|\.\d+)$')),
                            ],
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          //Enter Location Longitude
                          TextFormField(
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            controller:
                            _userProfileController.longitudeEditingController,
                            validator: (String? value) =>
                                _userProfileController.onValidate(value!),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                errorStyle: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                                filled: true,
                                alignLabelWithHint: true,
                                hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.blue,
                                hintText: "Enter Location Longitude",
                                focusedBorder: _outlineBorder,
                                enabled: true,
                                prefixIcon: const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                enabledBorder: _outlineBorder,
                                border: _outlineBorder),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'^-?(\d+(\.\d*)?|\.\d+)$')),
                            ],
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          ),


                          const SizedBox(
                            height: 20,
                          ),

                             // Specialization Category
                          DropdownButtonFormField<String>(
                            value: specialization,
                            onChanged: (String? newValue) {
                              setState(() {
                                specialization = newValue!;
                              });
                            },
                            decoration: InputDecoration(
                                errorStyle: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                                filled: true,
                                alignLabelWithHint: true,
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                fillColor: Colors.blue,
                                hintText: "Specialization",
                                focusedBorder: _outlineBorder,
                                enabled: true,
                                prefixIcon: const Icon(
                                  Icons.category,
                                  color: Colors.white,
                                ),
                                enabledBorder: _outlineBorder,
                                border: _outlineBorder),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            items: specializationCategories.map((category) {
                              return DropdownMenuItem<String>(
                                value: category,
                                child: Text(
                                  category,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomButton(
                    function: () => onNext(),
                    buttonText: "Next",
                    buttonColor: Colors.white,
                    icon: AppImages.doneIcon,
                    textColor: Colors.black)
              ],
            ),
          ),
        ),
      ),
    );
  }


  void onNext() {
    if (_userProfileController.selectedRole == 'Doctor') {
      if (_formKey.currentState!.validate()) {
        _userProfileController.doctorModel.value = DoctorModel(
            age: _userProfileController.ageEditingController.text,
            name: _userProfileController.nameEditingController.text,
            category: _userProfileController.selectedRole.value,
            specialization: specialization,
            isVerified: false,
            address:_userProfileController.addressEditingController.text,
            lat: _userProfileController.latitudeEditingController.text,
            lng: _userProfileController.latitudeEditingController.text,
            phoneNumber: _userProfileController.phoneEditingController.text,
            gender: _userProfileController.selectGender == Gender.male
                ? "male"
                : _userProfileController.selectGender == Gender.female
                ? "female"
                : "others");
        Get.toNamed(AppScreen.profileImageScreen);
      }
      else if (_userProfileController.selectedRole == 'Patient') {
        if (_formKey.currentState!.validate()) {
          _userProfileController.userModel.value = UserModel(
              age: _userProfileController.ageEditingController.text,
              name: _userProfileController.nameEditingController.text,
              category: _userProfileController.selectedRole.value,
              phoneNumber: _userProfileController.phoneEditingController.text,
              gender: _userProfileController.selectGender == Gender.male
                  ? "male"
                  : _userProfileController.selectGender == Gender.female
                  ? "female"
                  : "others");
          Get.toNamed(AppScreen.profileImageScreen);
        }

      }
    }
  }
}
