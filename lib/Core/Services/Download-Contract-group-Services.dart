import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' show Directory, Platform;

class DownloadGroupContractService {
  static downloadGroupContractFromUrl(String url) async {
    String localPath = (await _findLocalPath()) +
        Platform.pathSeparator +
        'Download-group-contract';
    final savedDir = Directory(localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    await FlutterDownloader.enqueue(
      url: url,
      savedDir: savedDir.path,
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
  }

  static Future<String> _findLocalPath() async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
