import 'package:get/get.dart';

class PagesController extends GetxController {
  static PagesController to = Get.find();

  var page = 'home'.obs;
  var xOffset = 0.0.obs;
  var yOffset = 0.0.obs;
  var scaleFactor = 1.0.obs;
  var isDrawerOpen = false.obs;
}