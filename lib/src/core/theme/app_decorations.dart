import 'package:ai_analysis/src/core/theme/app_border_radius.dart';
import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/core/theme/app_gradients.dart';
import 'package:ai_analysis/src/core/theme/app_shadow.dart';
import 'package:flutter/material.dart';

class AppDecorations {
  static BoxDecoration get card => BoxDecoration(
    gradient: AppGradients.cardGradient,
    borderRadius: AppBorderRadius.large,
    boxShadow: AppShadows.medium,
  );
  
  static BoxDecoration get primaryCard => BoxDecoration(
    color: AppColors.primaryText,
    borderRadius: AppBorderRadius.medium,
    boxShadow: AppShadows.light,
  );
  
  static BoxDecoration get surface => BoxDecoration(
    color: AppColors.surface,
    borderRadius: AppBorderRadius.large,
  );
  
  static BoxDecoration get button => BoxDecoration(
    gradient: AppGradients.orangeGradient,
    borderRadius: AppBorderRadius.circular,
    boxShadow: AppShadows.light,
  );
}