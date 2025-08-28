import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainNavigationController extends GetxController {
  final RxInt _selectedIndex = 4.obs;

  int get selectedIndex => _selectedIndex.value;

  void changeTab(int index) {
    if (index != 2) {
      _selectedIndex.value = index;
    }
  }

  // Add method to get current page title
  String getCurrentPageTitleKey() {
    switch (_selectedIndex.value) {
      case 0:
        return 'حسابي';
      case 1:
        return 'الشات';
      case 3:
        return 'التقويم';
      case 4:
        return 'الرئسية';
      default:
        return '';
    }
  }

  // Add method to check if AppBar should be shown
  bool get shouldShowAppBar => _selectedIndex.value == 4;
}
