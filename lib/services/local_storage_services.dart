import 'dart:convert';
import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  static final LocalStorageService _localStorageInstance =
  LocalStorageService._initialization();

  LocalStorageService._initialization();

  factory LocalStorageService() {
    return _localStorageInstance;
  }

  static LocalStorageService get localStorageInstance => _localStorageInstance;

  GetStorage localStorage = GetStorage();

  void setUserData(dynamic userModel) async {
    await localStorage.write("user", jsonEncode(userModel.toJson()));
  }

  Future<String> getUserData() async {
    String userData = localStorage.read("user") ?? "";
    if (userData.isNotEmpty) {
      return userData;
    }
    return "";
  }

  Future<void> removeSession() async {
    await localStorage.remove("user");
  }


}
