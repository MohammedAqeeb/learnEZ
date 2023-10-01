import 'package:learnez/constants/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences sharedPreferences;

  Future<StorageService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    return this;
  }

  Future<bool> setDeviceOpened(String key, bool value) async {
    return await sharedPreferences.setBool(key, value);
  }

  bool getDeviceOpened() {
    return sharedPreferences.getBool(Constant.deviceOpenedFirstTime) ?? false;
  }

  Future<bool> setUserId(String key, bool value) {
    return sharedPreferences.setBool(key, value);
  }

  bool getUserId() {
    return sharedPreferences.getBool(Constant.userId) ?? false;
  }
}
