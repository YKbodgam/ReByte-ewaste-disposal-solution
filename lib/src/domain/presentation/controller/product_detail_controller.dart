import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  var currentImageIndex = 0.obs;
  var showTutorial = true.obs;
  var slideOffset = 0.0.obs;

  void startTutorialAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    slideOffset.value = 0.1;

    await Future.delayed(const Duration(milliseconds: 600));
    slideOffset.value = -0.1;

    await Future.delayed(const Duration(milliseconds: 600));
    slideOffset.value = 0.0;

    await Future.delayed(const Duration(milliseconds: 800));
    showTutorial.value = false;
  }
}
