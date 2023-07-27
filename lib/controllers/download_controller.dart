import 'package:gallery_saver/gallery_saver.dart';

import '../model/photo.dart';

class DownloadController {
  Future<bool?> getDownloadImage(Photo photo) async {
    String url = photo.src.portrait;
    return await GallerySaver.saveImage(url);
  }
}
