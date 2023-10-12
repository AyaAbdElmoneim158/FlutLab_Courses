import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? shared;
  static Future<SharedPreferences> init() async =>
      shared = await SharedPreferences.getInstance();
  static Future<bool> setData(String key, dynamic value) async {
    switch (value.runtimeType) {
      case int:
        return await shared!.setInt(key, value);
      case bool:
        return await shared!.setBool(key, value);
      case double:
        return await shared!.setDouble(key, value);
      case String:
        return await shared!.setString(key, value);
      case List<String>:
        return shared!.setStringList(key, value);
      default:
        return await shared!.setString(key, value);
    }
  }
  
  static dynamic getData({required String key})  =>  shared!.get(key);
  
  static Future<bool> removeData({required String key}) async => await shared!.remove(key);

}
