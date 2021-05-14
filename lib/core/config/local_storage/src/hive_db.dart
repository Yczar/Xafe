import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

///[BOXES].
const String kBoxUser = 'user_box';



Future<void> setupHive() async {
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  /* Hive.registerAdapter(UserAccountModelAdapter()); */

  ///Open Boxes
  await Hive.openBox(kBoxUser);
}

class HivePref {
  ///Preference for [bool] values
  static bool getBool(
    String boxName, {
    @required String key,
  }) =>
      Hive.box(boxName).get(key, defaultValue: false);

  Future setBool(
    String boxName, {
    @required String key,
    bool value,
  }) =>
      Hive.box(boxName).put(key, value);

  ///Preference for [String] values
  static String getString(
    String boxName, {
    @required String key,
  }) =>
      Hive.box(boxName).get(key, defaultValue: '');

  Future setString(
    String boxName, {
    @required String key,
    String value,
  }) =>
      Hive.box(boxName).put(key, value);
}
