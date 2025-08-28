// import 'package:flutter/material.dart';
// import 'app_colors.dart';

// class AppTheme {
//   static final lightTheme = ThemeData(
//     brightness: Brightness.light,
//     scaffoldBackgroundColor: AppColors.white,
//     cardColor: Colors.white, // لون خلفية الكارد في الوضع الفاتح أبيض
//     shadowColor: Colors.grey.withOpacity(0.3), // ظل رمادي فاتح
//     appBarTheme: const AppBarTheme(
//       backgroundColor: AppColors.primary,
//       titleTextStyle: TextStyle(color: AppColors.white, fontSize: 20),
//       iconTheme: IconThemeData(color: AppColors.white),
//     ),
//     colorScheme: const ColorScheme.light(
//       primary: AppColors.primary,
//       secondary: AppColors.secondary,
//       error: AppColors.error,
//       surface: AppColors.white,
//       onPrimary: AppColors.white,
//       onSecondary: AppColors.onSecondary,
//     ),
//     textTheme: const TextTheme(
//       bodyLarge: TextStyle(color: AppColors.text),
//       bodyMedium: TextStyle(color: AppColors.text),
//     ),
//     bottomSheetTheme: const BottomSheetThemeData(
//       backgroundColor: Colors.white, // لون الخلفية اللي تبغاها للقائمة
//     ),
//   );

//   static final darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     scaffoldBackgroundColor: AppColors.darkBackground,
//     cardColor: AppColors.black, // خلفية الكارد بالوضع الداكن أسود أو قريب منه
//     shadowColor: Colors.black.withOpacity(0.7), // ظل قوي للوضع الداكن
//     appBarTheme: const AppBarTheme(
//       backgroundColor: AppColors.black,
//       titleTextStyle: TextStyle(color: AppColors.white, fontSize: 20),
//       iconTheme: IconThemeData(color: AppColors.white),
//     ),
//     colorScheme: const ColorScheme.dark(
//       primary: AppColors.primary,
//       secondary: AppColors.secondary,
//       error: AppColors.error,
//       surface: AppColors.black,
//       onPrimary: AppColors.white,
//       onSecondary: AppColors.onSecondary,
//     ),
//     textTheme: const TextTheme(
//       bodyLarge: TextStyle(color: AppColors.white),
//       bodyMedium: TextStyle(color: AppColors.white),
//     ),
//     bottomSheetTheme: const BottomSheetThemeData(
//       backgroundColor: Colors.black, // لون الخلفية في الوضع الداكن
//     ),
//   );
// }
import 'package:ai_analysis/src/core/theme/app_border_radius.dart';
import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surface,
      background: AppColors.background,
      error: AppColors.error,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      titleTextStyle: AppTextStyling.heading2,
      iconTheme: IconThemeData(color: AppColors.textWhite),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textWhite,
        textStyle: AppTextStyling.button,
        shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.medium),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.large),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyling.heading1,
      displayMedium: AppTextStyling.heading2,
      displaySmall: AppTextStyling.heading3,
      bodyLarge: AppTextStyling.bodyLarge,
      bodyMedium: AppTextStyling.bodyMedium,
      bodySmall: AppTextStyling.bodySmall,
      labelLarge: AppTextStyling.label,
      labelMedium: AppTextStyling.caption,
    ),
  );
}
