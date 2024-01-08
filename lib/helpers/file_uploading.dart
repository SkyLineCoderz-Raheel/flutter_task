// import 'package:file_picker/file_picker.dart' ;
import 'package:image_picker/image_picker.dart';

class FilePick{
  // Future<String?> pickFile() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //         allowMultiple: false, // Ensure only one file is selected
  //         type: FileType.any
  //     );
  //     if (result != null) {
  //       return result.files.single.path;
  //     } else {
  //       // User canceled the picker
  //       return 'User canceled the file picker.';
  //     }
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }
  Future<String> pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile == null) {
        print("User canceled the picker");
        return "User canceled the picker"; // User canceled the picker
      }
        return pickedFile.path;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
