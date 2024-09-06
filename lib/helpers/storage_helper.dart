
import 'package:permission_handler/permission_handler.dart';

class StorageHelper {
  // static Future<String> getExternalDocumentPath() async {
  //   var status = await Permission.storage.status;
  //   if (!status.isGranted) {
  //     await Permission.storage.request();
  //   }
  //   Directory _directory = Directory("");
  //   if (Platform.isAndroid) {
  //     _directory = Directory("/storage/emulated/0/Download");
  //   } else {
  //     _directory = await getApplicationDocumentsDirectory();
  //   }

  //   final exPath = _directory.path;
  //   await Directory(exPath).create(recursive: true);
  //   return exPath;
  // }

  static Future<void> initialize() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }
}
