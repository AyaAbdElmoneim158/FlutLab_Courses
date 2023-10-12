//ToDo:> General Box import '../../../models/model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeService {
  static final Box _box = Hive.box("favorites_box");
  static Future<void> addFavorite( quranModel) async {
    _box.add(quranModel);
  }

  static Future<void> removeFavorite(String title) async => _box.delete(title);

  static List<dynamic> getFavorites() => _box.values.toList();

  static bool isFavorite(String ayetAudio) => _box.containsKey(ayetAudio);

  static void clearFavorites() => _box.clear();

  static Future<void> deleteFavorite(String title) async => _box.delete(title);

  static Future<void> updateFavorite(String title, String url) async =>
      _box.put(title, url);

  static Future<void> deleteAllFavorites() async => _box.clear();

  static Future<void> updateAllFavorites(Map<String, String> map) async =>
      _box.putAll(map);

  static Future<void> updateAllFavoritesFromList(List<String> list) async =>
      _box.putAll(list as Map);

  static Future<void> deleteAllFavoritesFromList(List<String> list) async =>
      _box.deleteAll(list);

  static Future<void> updateAllFavoritesFromMap(
          Map<String, String> map) async =>
      _box.putAll(map);

  static Future<void> deleteAllFavoritesFromMap(
          Map<String, String> map) async =>
      _box.deleteAll(map as Iterable);

  static Future<void> deleteAllFavoritesFromListAndMap(
      List<String> list, Map<String, String> map) async {
    _box.deleteAll(list);
    _box.putAll(map);
  }

  static Future<void> updateAllFavoritesFromListAndMap(
      List<String> list, Map<String, String> map) async {
    _box.putAll(list as Map);
    _box.putAll(map);
  }

  static Future<void> updateAllFavoritesFromMapAndList(
      Map<String, String> map, List<String> list) async {
    _box.putAll(map);
    _box.putAll(list as Map);
  }

  static Future<void> deleteAllFavoritesFromMapAndList(
      Map<String, String> map, List<String> list) async {
    _box.deleteAll(map as Iterable);
    _box.deleteAll(list);
  }

  static Future<void> deleteAllFavoritesFromListAndMapAndList(
      List<String> list, Map<String, String> map, List<String> list2) async {
    _box.deleteAll(list);
    _box.putAll(map);
    _box.deleteAll(list2);
  }

  static Future<void> updateAllFavoritesFromListAndMapAndList(
      List<String> list, Map<String, String> map, List<String> list2) async {
    _box.putAll(list as Map);
    _box.putAll(map);
    _box.putAll(list2 as Map);
  }

  static Future<void> updateAllFavoritesFromMapAndListAndList(
      Map<String, String> map, List<String> list, List<String> list2) async {
    _box.putAll(map);
    _box.putAll(list as Map);
    _box.putAll(list2 as Map);
  }

  static Future<void> deleteAllFavoritesFromMapAndListAndList(
      Map<String, String> map, List<String> list, List<String> list2) async {
    _box.deleteAll(map as Iterable);
    _box.deleteAll(list);
    _box.deleteAll(list2);
  }

  static Future<void> deleteAllFavoritesFromListAndMapAndListAndList(
      List<String> list,
      Map<String, String> map,
      List<String> list2,
      List<String> list3) async {
    _box.deleteAll(list);
    _box.putAll(map);
    _box.deleteAll(list2);
    _box.deleteAll(list3);
  }

  static Future<void> updateAllFavoritesFromListAndMapAndListAndList(
      List<String> list,
      Map<String, String> map,
      List<String> list2,
      List<String> list3) async {}

  static Future<void> updateAllFavoritesFromMapAndListAndListAndList() async {}
}
