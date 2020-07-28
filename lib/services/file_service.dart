import 'package:image_picker/image_picker.dart';

class FileService {
  static Future<String> getImage({bool camera = false}) async {
    var image = await ImagePicker.platform
        .pickImage(source: camera ? ImageSource.camera : ImageSource.gallery);
    return image.path;
  }
}
