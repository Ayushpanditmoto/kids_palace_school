import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveServices {
  static String boxName = "testBox";

  //add this to main.dart to initialize Hive
  //Future<void> main() async {
  //  WidgetsFlutterBinding.ensureInitialized();
  //  await HiveServices.initHive();
  //  runApp(MyApp());
  //}
  static void initHive() async {
    var dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter();
    Hive.init(dir.path);
  }

  static void storeData(String key, String temp) async {
    var box = await Hive.openBox(boxName);
    await box.put(key, temp);
    Hive.close();
  }

  static void getData(String key) async {
    var box = await Hive.openBox(boxName);
    box.get(key);
    Hive.close();
  }
}
