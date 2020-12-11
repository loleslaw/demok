import 'package:demok/00_models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  Rx<UserModel> user = Rx<UserModel>();
  String get currentSex => user.value.plec;
  String get currentEducation => user.value.education;
  double get currentAge => user.value.age;
  double get currentPolPref => user.value.polPref;

  @override
  void onInit() {
    // TODO: implement onInit
    user.value = UserModel();
    user.value.plec = 'M';
    user.value.education = '0';
    user.value.age = 20;
    user.value.polPref = 0;
    super.onInit();
  }

  setUserPlec(String plec) {
    user.value.plec = plec;
    print('Wybrana płeć to  ${user.value.plec}');
    update();
  }

  setUserEducation(String education) {
    user.value.education = education;
    print('Wybrano edukacje ${user.value.education}');
    update();
  }

  setUserAge(double age) {
    user.value.age = age;
    update();
  }
    setUserPolPref(double polPref) {
    user.value.polPref = polPref;
    update();
  }

  saveUserData() {
    print('zapis danych do bazy ');
  }
}