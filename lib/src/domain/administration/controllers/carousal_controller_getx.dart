import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';

class CarouselControllerGetx extends GetxController {
  var currentIndex = 0.obs;
  final CarouselSliderController carouselController =
      CarouselSliderController();

  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
