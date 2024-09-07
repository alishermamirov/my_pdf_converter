import 'dart:io';

import 'package:share_plus/share_plus.dart';

class ShareHelper {
  static Future<void> shareFile(File file, String title) async {
    final result =
        await Share.shareXFiles([XFile(file.path)], text: title);

    if (result.status == ShareResultStatus.success) {
      print('Thank you for sharing the picture!');
    }
  }
}
