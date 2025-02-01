import 'package:flutter/material.dart';
import 'package:football_app/app/modules/gallery/view/gallery_view.dart';
import 'package:football_app/app/utils/color_manager.dart';
import 'package:get/get.dart';

import '../../home/view/home_view.dart';
import '../../profile/view/profile_view.dart';
import '../../standings/view/standings_view.dart';
import '../controller/bottom_nav_controller.dart';
class BottomNavView extends GetView<BottomNavController> {
  BottomNavView({Key? key}) : super(key: key);

  final List<Widget> pages = [
    HomeView(),
    StandingsView(),
    GalleryView(),
    ProfileView(),
  ];

  final List<String> icons = [
    'assets/icons/home_icon.png',
    'assets/icons/standings_icon.png',
    'assets/icons/bookmarks_icon.png',
    'assets/icons/profile_icon.png'
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());

    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorManager.primaryAppColor1,
          selectedItemColor: ColorManager.whiteColor,
          unselectedItemColor: ColorManager.secondaryAppColor1,
          items: List.generate(
            icons.length,
                (index) => BottomNavigationBarItem(
              icon: Image.asset(
                icons[index],
                width: 24,
                height: 24,
                color: controller.selectedIndex.value == index
                    ? ColorManager.whiteColor
                    : ColorManager.secondaryAppColor1
              ),
              label: ['', '', '', ''][index],
            ),
          ),
        ),
      ),
    );
  }
}
