import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/core/theme/app_spacing.dart';
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/auth/data/model/ticket_model.dart';
import 'package:flutter/material.dart';

class ServiceStatusCard extends StatelessWidget {
  final Ticket ticket;
  const ServiceStatusCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF16213e),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF1A1A2E).withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'الخدمات',
              style: AppTextStyling.font16W500TextInter.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: AppSpacing.md),
          ServiceRow(
            icon: Icons.build,
            title: 'تغيير زيت',
            status: 'قيد التنفيذ',
            statusColor: AppColors.primaryText,
          ),
          Divider(color: Colors.white24, height: 30),
          ServiceRow(
            icon: Icons.local_car_wash,
            title: 'غسيل المركبة',
            status: 'منفذة',
            statusColor: AppColors.green,
          ),
          Divider(color: Colors.white24, height: 30),
          ServiceRow(
            icon: Icons.settings,
            title: 'فحص عام',
            status: 'لم تنفذ',
            statusColor: AppColors.red,
          ),
        ],
      ),
    );
  }
}

class ServiceRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String status;
  final Color statusColor;

  const ServiceRow({
    super.key,
    required this.icon,
    required this.title,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon, color: statusColor, size: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: AppTextStyling.font16W500TextInter.copyWith(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 5),
            Text(
              status,
              style: AppTextStyling.font16W500TextInter.copyWith(
                color: statusColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
