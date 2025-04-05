import 'package:get/get.dart';

class TabController extends GetxController {
  var tabIndex = 0.obs;
  var totalTabs = 4;

  void nextTab() {
    if (tabIndex.value < totalTabs - 1) {
      tabIndex.value++;
    }
  }

  void previousTab() {
    if (tabIndex.value > 0) {
      tabIndex.value--;
    }
  }
}
