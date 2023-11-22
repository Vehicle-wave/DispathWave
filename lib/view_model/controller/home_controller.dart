import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxInt currentIndex=0.obs;
  final PageController controller=PageController();

  changePageIndex(int index){
    currentIndex.value=index;
    controller.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }

}