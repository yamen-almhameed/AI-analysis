import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:get/get.dart';
import 'ar.dart';
import 'en.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'ar': ar, 'en': en};
}
