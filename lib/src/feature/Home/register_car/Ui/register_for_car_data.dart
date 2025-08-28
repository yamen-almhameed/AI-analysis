import 'package:ai_analysis/src/core/theme/Animation.dart';
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/Home/register_car/controller/reg_car_controller.dart';
import 'package:ai_analysis/src/feature/Home/register_car/widgets/datatime_date.dart';
import 'package:ai_analysis/src/feature/auth/UI/widgets/elevated_buttom_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterForCarData extends StatelessWidget {
  const RegisterForCarData({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('dd/MM/yyyy').format(now);
    final formattedTime = DateFormat('hh:mm a').format(now);
    final controller = Get.find<RegCarController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F0F23)],
            ),
          ),
          child: AnimatedFade(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // AppBar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      Text(
                        'التاريخ والوقت',
                        style: AppTextStyling.font26W500TextInter.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Entry Date & Time Card
                  buildInfoCard(
                    title: 'تاريخ ووقت دخول المركبة',
                    icon1: Icons.calendar_month,
                    text1: formattedDate,
                    icon2: Icons.access_time,
                    text2: formattedTime,
                  ),
                  const SizedBox(height: 20),

                  // Exit Date & Time Picker
                  buildExitDateTimeCard(controller: controller),
                  const SizedBox(height: 30),

                  // Submit Button
                  ElevatedButtonCustom(
                    text: 'تسجيل المركبة',
                    onPressed: () {
                      print(
                        "موعد الخروج: ${controller.dateExitCarController.text}",
                      );
                    },
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard({
    required String title,
    required IconData icon1,
    required String text1,
    required IconData icon2,
    required String text2,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Colors.blue.withOpacity(0.2), Colors.blue.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 6),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyling.font16W500TextInter.copyWith(
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(icon1, color: Colors.white),
              const SizedBox(width: 12),
              Text(
                text1,
                style: AppTextStyling.font16W500TextInter.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(icon2, color: Colors.white),
              const SizedBox(width: 12),
              Text(
                text2,
                style: AppTextStyling.font16W500TextInter.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildExitDateTimeCard({required RegCarController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الوقت المتوقع لخروج المركبة',
          style: AppTextStyling.font16W500TextInter.copyWith(
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 10),
        DatatimeDate(controller: controller.dateExitCarController),
      ],
    );
  }
}
