import 'package:ai_analysis/src/feature/Home/logout_car/UI/payment_success_screen.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/calculation_summary.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/loading_dilaog.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/payment_fileds.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/payment_header.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/process_button.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/wallet_option.dart';
import 'package:ai_analysis/src/feature/account/presentaion/controller/profile_controller.dart';
import 'package:ai_analysis/src/feature/account/presentaion/view/widgets/wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class PaymentMethodScreen extends StatefulWidget {
  final double totalAmount;
  final double walletBalance;
  final Map<String, dynamic> carData;

  const PaymentMethodScreen({
    super.key,
    required this.totalAmount,
    required this.walletBalance,
    required this.carData,
  });

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final TextEditingController _cashController = TextEditingController();
  final TextEditingController _visaController = TextEditingController();
  final TextEditingController _discountController =
      TextEditingController(); // جديد
  double cashAmount = 0.0;
  double visaAmount = 0.0;
  double walletAmount = 0.0;
  double remainingAmount = 0.0;
  double excessAmount = 0.0;

  bool useWallet = false;

  @override
  void initState() {
    super.initState();
    remainingAmount = widget.totalAmount;

    _animationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _cashController.dispose();
    _visaController.dispose();
    super.dispose();
  }

  void _calculateAmounts() {
    setState(() {
      cashAmount = double.tryParse(_cashController.text) ?? 0.0;
      visaAmount = double.tryParse(_visaController.text) ?? 0.0;
      walletAmount = useWallet
          ? (widget.walletBalance >= widget.totalAmount
                ? widget.totalAmount - cashAmount - visaAmount
                : widget.walletBalance)
          : 0.0;
      walletAmount = walletAmount < 0 ? 0 : walletAmount;

      double totalPaid = cashAmount + visaAmount + walletAmount;
      if (totalPaid > widget.totalAmount) {
        excessAmount = totalPaid - widget.totalAmount;
        remainingAmount = 0.0;
      } else {
        remainingAmount = widget.totalAmount - totalPaid;
        excessAmount = 0.0;
      }
    });
  }

  bool _canProcessPayment() =>
      cashAmount + visaAmount + walletAmount >= widget.totalAmount;

  void _processPayment() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => LoadingDialog(),
    );

    Future.delayed(Duration(seconds: 3), () {
      Get.back();
      Get.to(
        () => PaymentSuccessScreen(
          carData: widget.carData,
          totalAmount: widget.totalAmount,
          cashAmount: cashAmount,
          visaAmount: visaAmount,
          walletAmount: walletAmount,
          excessAmount: excessAmount,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                PaymentHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        WalletCard(
                          controller: Get.find<ProfileController>(),
                          padding: 5,
                        ),
                        SizedBox(height: 20),
                        WalletOption(
                          walletBalance: widget.walletBalance,
                          useWallet: useWallet,
                          onChanged: (val) {
                            setState(() => useWallet = val);
                            _calculateAmounts();
                          },
                        ),
                        SizedBox(height: 20),
                        PaymentFields(
                          cashController: _cashController,
                          visaController: _visaController,
                          discountController:
                              _discountController, // أضف هذا الكنترولر الجديد
                          onChanged: _calculateAmounts,
                        ),

                        SizedBox(height: 20),
                        CalculationSummary(
                          cashAmount: cashAmount,
                          visaAmount: visaAmount,
                          walletAmount: walletAmount,
                          remainingAmount: remainingAmount,
                          excessAmount: excessAmount,
                        ),
                        SizedBox(height: 30),
                        ProcessButton(
                          canProcess: _canProcessPayment(),
                          onPressed: _processPayment,
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
    );
  }
}
