import 'package:ai_analysis/src/feature/Home/logout_car/widgets/action_button.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/car_info_card.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/fee_break_down_card.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/header_widget.dart';
import 'package:ai_analysis/src/feature/account/presentaion/controller/profile_controller.dart';
import 'package:ai_analysis/src/feature/account/presentaion/view/widgets/wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CarPaymentDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> carData;
  const CarPaymentDetailsScreen({super.key, required this.carData});

  @override
  State<CarPaymentDetailsScreen> createState() =>
      _CarPaymentDetailsScreenState();
}

class _CarPaymentDetailsScreenState extends State<CarPaymentDetailsScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  double walletBalance = 75.0;
  double totalAmount = 46.0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      backgroundColor: Color(0xFF0F0F23),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topRight,
            radius: 1.0,
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F0F23)],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Column(
                children: [
                  HeaderWidget(),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          CarInfoCard(carData: widget.carData),
                          SizedBox(height: 20),
                          FeeBreakdownCard(totalAmount: totalAmount),
                          SizedBox(height: 20),
                          WalletCard(controller: controller),
                          SizedBox(height: 30),
                          ActionButton(
                            totalAmount: totalAmount,
                            walletBalance: walletBalance,
                            carData: widget.carData,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
