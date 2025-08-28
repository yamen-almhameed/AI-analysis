import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/feature/Home/UI/homescreen.dart';
import 'package:ai_analysis/src/feature/Home/controller/main_navigation_controller.dart';
import 'package:ai_analysis/src/feature/Home/widgets/Bottom_nav_item.dart';
import 'package:ai_analysis/src/feature/Home/widgets/myUserDrawer.dart';
import 'package:ai_analysis/src/feature/account/presentaion/view/profile.dart';
import 'package:ai_analysis/src/feature/calendar/calender_screen.dart';
import 'package:ai_analysis/src/feature/chat/UI/chat_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWrapper extends StatelessWidget {
  HomeWrapper({super.key});

  final MainNavigationController navController =
      Get.find<MainNavigationController>();

  List<Widget> get pages => [
    Profile(),
    ChatListScreen(),
    SizedBox(),
    CalenderScreen(),
    Home(),
  ];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<BottomNavItem> get bottomNavItems {
    final isArabic = Get.locale?.languageCode == 'ar';

    if (isArabic) {
      return [
        BottomNavItem(
          image: 'assets/home3.png',
          label: 'الرئيسية',
          onTap: () => navController.changeTab(4),
          isSelected: navController.selectedIndex == 4,
        ),

        BottomNavItem(
          image: 'assets/uit_calender.png',
          label: 'التقويم',
          onTap: () => navController.changeTab(3),
          isSelected: navController.selectedIndex == 3,
        ),
        BottomNavItem(
          image: 'assets/messagenotif.png',
          label: 'شات',
          onTap: () {
            navController.changeTab(1);
          },
          isSelected: navController.selectedIndex == 1,
        ),
        BottomNavItem(
          image: 'assets/user.png',
          label: 'حسابي',
          onTap: () => navController.changeTab(0),
          isSelected: navController.selectedIndex == 0,
        ),
      ];
    } else {
      return [
        BottomNavItem(
          image: 'assets/home3.png',
          label: 'الرئيسية',
          onTap: () => navController.changeTab(4),
          isSelected: navController.selectedIndex == 4,
        ),

        BottomNavItem(
          image: 'assets/uit_calender.png',
          label: 'التقويم',
          onTap: () => navController.changeTab(3),
          isSelected: navController.selectedIndex == 3,
        ),
        BottomNavItem(
          image: 'assets/messagenotif.png',
          label: 'شات',
          onTap: () {
            navController.changeTab(1);
          },
          isSelected: navController.selectedIndex == 1,
        ),
        BottomNavItem(
          image: 'assets/user.png',
          label: 'حسابي',
          onTap: () => navController.changeTab(0),
          isSelected: navController.selectedIndex == 0,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(
      () => Scaffold(
        key: scaffoldKey,
        drawer: const MyUserDrawer(),
        // appBar: navController.shouldShowAppBar
        //     ? HomeAppBar(
        //         title: navController.getCurrentPageTitleKey().tr,
        //         image: 'assets/Menu (1).png',
        //         notification: 'assets/notification-bing.png',
        //         drawerTap: () => scaffoldKey.currentState?.openDrawer(),
        //       )
        //     : null,
        body: IndexedStack(index: navController.selectedIndex, children: pages),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          color: AppColors.backGroundPrimary,
          elevation: 8,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: bottomNavItems
                  .map((item) => Expanded(child: item))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
