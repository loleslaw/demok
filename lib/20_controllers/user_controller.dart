import 'package:demok/00_models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  Rx<UserModel> user = Rx<UserModel>();
  String get currentSex => user.value.plec;
  String get currentEducation => user.value.education;
  double get currentAge => user.value.age;
  int get currentLangs => user.value.langs;
  String get currentPostalCode => user.value.postalCode;
  int get currentOccupation => user.value.occupation;
  double get currentPref_X => user.value.pref_X;
  double get currentPref_Y => user.value.pref_Y;
  bool get profileHasChanged => _profileHasCHanged.value;

  var _profileHasCHanged = false.obs;

  @override
  void onInit() {
    user.value = UserModel();
    user.value.plec = 'K';
    user.value.education = '0';
    user.value.age = 20;
    user.value.langs = 0;
    user.value.postalCode = '_';
    user.value.occupation = 0;
    user.value.pref_X = -0.3;
    user.value.pref_Y = -0.3;
    super.onInit();
  }

  setUserPlec(String plec) {
    user.value.plec = plec;
    _update();
  }

  setUserEducation(String education) {
    user.value.education = education;
    _update();
  }

  setUserAge(double age) {
    user.value.age = age;
    _update();
  }

  setLangs(String langs) {
    user.value.langs = int.tryParse(langs) ?? 1;
    _update();
  }
    setPostalCode(String code) {
    user.value.postalCode = code;
    _update();
  }
    setOccupation(String occupation) {
    user.value.occupation = int.tryParse(occupation) ?? 0;
    _update();
  }

  setPreferences({double x, double y}) {
    user.value.pref_X = x;
    user.value.pref_Y = y;
    _update();
  }
  _update() {
    _profileHasCHanged.value = true;
    update();
  }

  saveUserData() {
    print('zapis danych do bazy ');
  }
}