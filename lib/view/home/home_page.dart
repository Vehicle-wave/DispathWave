import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/res/assets/app_images.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/view/drawer/drawer.dart';
import 'package:wave_dispatch/view/loads/loads.dart';
import 'package:wave_dispatch/view/profile/profile.dart';
import 'package:wave_dispatch/view/recents/recents.dart';
import 'package:wave_dispatch/view_model/controller/home_controller.dart';

import 'components/home_top_header.dart';
import 'components/home_view.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
   final controller =Get.put(HomeController());
  @override
  Widget build(BuildContextcontext) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        floatingActionButton: FloatingActionButton(onPressed: () {  },
          //params
          backgroundColor: Colors.red,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: Colors.transparent
            )
          ),
          child: Center(
            child: Icon(Icons.shopping_cart_checkout,color: Colors.white,),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
          icons: const [
            Icons.menu_book,
            Icons.event_note,
            Icons.library_books_rounded,
            Icons.person
          ],
          activeIndex: controller.currentIndex.value,
          gapLocation: GapLocation.center,
          activeColor: primaryColor,
          inactiveColor: Colors.grey,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index){
            controller.changePageIndex(index);
          },
          //other params
        )),
        body: SafeArea(
          child: Column(
            children: [
              const HomeTopHeader(),
              Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller.controller,
                  children: [
                    HomeView(),
                    Loads(),
                    RecentRequests(),
                    Profile()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


