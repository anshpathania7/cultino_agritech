import 'package:cultino_agritech/models/profile_data_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScreenOneController extends GetxController {
  //
  late String? name;
  late String? emaild;
  late Gender? gender;
  late String? imagePath;
  late String? toShowBelowSubmit;
  late GetStorage box;

  set addName(String val) => name = val;

  set addEmailId(String val) => emaild = val;

  set addGender(Gender val) => gender = val;

  set addImagePath(String? val) {
    imagePath = val;
    update();
  }

  bool saveThisDetails() {
    if (name != null && emaild != null && gender != null && imagePath != null) {
      //saveLocally;
      box = GetStorage();

      box.write("name", name);
      box.write("gender", gender.toString().split(".").last);
      box.write("emailid", emaild);
      box.write("imagePath", imagePath);
      print("Saved INFO Locally");
      return true;
    } else {
      return false;
    }
  }

  void init() {
    box = GetStorage();
    name = box.read("name");
    gender = (box.read("gender") == "MALE") ? Gender.MALE : Gender.FEMALE;
    emaild = box.read("emailid");
    imagePath = box.read("imagePath");
    if (name != null && gender != null && emaild != null) {
      toShowBelowSubmit = """
    DATA
    NAME : $name 
    GENDER : $gender
    EMAILID : $emaild 
    IMAGEPATH : $imagePath
    """;
    } else {
      toShowBelowSubmit = "";
    }
  }
}
