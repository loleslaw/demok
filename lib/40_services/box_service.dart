import 'package:get_storage/get_storage.dart';
import 'package:uuid/uuid.dart';

class BoxStorage {
  static final box =  GetStorage();

  static String getUserId() {
    String uid = box.read('UserId');
    if (uid == null ||  uid=='') {
      var uuid = Uuid();
      String uid = uuid.v1();
      box.write('UserId', uid);
      print('Tworzę nowy uid $uid');
    }
    return uid;
  }

  static void setUserId(String userId) {
    box.write('UserId', userId);
  }
}