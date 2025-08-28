import 'package:ai_analysis/src/feature/account/presentaion/controller/profile_controller.dart';
import 'package:ai_analysis/src/feature/account/presentaion/view/widgets/info_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/profile_header.dart';
import 'widgets/wallet_card.dart';
import 'widgets/edit_dialog.dart';
import 'widgets/logout_dialog.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final ProfileController controller = Get.put(ProfileController());

  void _editProfile(BuildContext context) {
    showDialog(context: context, builder: (_) => EditDialog());
  }

  void _logout(BuildContext context) {
    LogoutDialog.show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SingleChildScrollView(
        child: GetBuilder<ProfileController>(
          builder: (_) {
            return Column(
              children: [
                ProfileHeader(controller: controller),
                WalletCard(controller: controller),
                InfoSection(
                  controller: controller,
                  onEdit: () => _editProfile(context),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _logout(context),
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Color(0xFFE74C3C),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFE74C3C).withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          "تسجيل الخروج",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
