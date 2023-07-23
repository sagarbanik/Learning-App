import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning/common/values/constant.dart';

class StorageService{
  late final SharedPreferences prefs;

  Future<StorageService> init() async{
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key,bool value) async {
    return await prefs.setBool(key, value);
  }

  bool getDeviceFirstOpen(){
    return prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  Future<bool> setString(String key,String value) async {
    return await prefs.setString(key, value);
  }

  bool getIsLoggedIn(){
    return prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null ? false : true;
  }

  Future<bool> remove(String key){
    return prefs.remove(key);
  }

}