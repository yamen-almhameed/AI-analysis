import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final Map<String, dynamic> carData;
  final double totalAmount;
  final double cashAmount;
  final double visaAmount;
  final double walletAmount;
  final double excessAmount;

  const PaymentSuccessScreen({
    super.key,
    required this.carData,
    required this.totalAmount,
    required this.cashAmount,
    required this.visaAmount,
    required this.walletAmount,
    required this.excessAmount,
  });

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
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
    return Scaffold(
      backgroundColor: Color(0xFF0F0F23),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F0F23)],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF43e97b), Color(0xFF38f9d7)],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF43e97b).withOpacity(0.5),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Icon(Icons.check, color: Colors.white, size: 60),
                    ),
                  ),

                  SizedBox(height: 30),

                  Text(
                    'تم الدفع بنجاح!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 10),

                  Text(
                    'تم تسجيل خروج المركبة وتحديث رصيد المحفظة',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 40),

                  _buildPaymentSummary(),

                  SizedBox(height: 40),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // إنشاء وطباعة الإيصال
                            _printReceipt();
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.white.withOpacity(0.3),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.print, size: 20),
                              SizedBox(width: 8),
                              Text('طباعة الإيصال'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // العودة للصفحة الرئيسية
                            Get.offAllNamed('/Home');
                          },
                          style:
                              ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ).copyWith(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.transparent,
                                ),
                              ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF43e97b), Color(0xFF38f9d7)],
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Center(
                              child: Text(
                                'العودة للرئيسية',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المركبة: ${widget.carData['plateNumber']}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${widget.totalAmount.toInt()} دينار',
                style: TextStyle(
                  color: Color(0xFF43e97b),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          if (widget.cashAmount > 0 ||
              widget.visaAmount > 0 ||
              widget.walletAmount > 0) ...[
            SizedBox(height: 15),
            Container(height: 1, color: Colors.white.withOpacity(0.2)),
            SizedBox(height: 15),
          ],

          if (widget.cashAmount > 0)
            _buildPaymentMethodRow(
              'نقدي',
              widget.cashAmount,
              Icons.money,
              Color(0xFF43e97b),
            ),

          if (widget.visaAmount > 0)
            _buildPaymentMethodRow(
              'فيزا',
              widget.visaAmount,
              Icons.credit_card,
              Color(0xFF4facfe),
            ),

          if (widget.walletAmount > 0)
            _buildPaymentMethodRow(
              'محفظة',
              widget.walletAmount,
              Icons.account_balance_wallet,
              Color(0xFFf093fb),
            ),

          if (widget.excessAmount > 0) ...[
            SizedBox(height: 15),
            Container(height: 1, color: Colors.white.withOpacity(0.2)),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.add_circle, color: Color(0xFF43e97b), size: 20),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'تم إضافة ${widget.excessAmount.toStringAsFixed(1)} دينار للمحفظة',
                    style: TextStyle(
                      color: Color(0xFF43e97b),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPaymentMethodRow(
    String method,
    double amount,
    IconData icon,
    Color color,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 16),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              method,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14,
              ),
            ),
          ),
          Text(
            '${amount.toStringAsFixed(1)} د',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void _printReceipt() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('طباعة الإيصال', style: TextStyle(color: Colors.white)),
        content: Text(
          'سيتم طباعة إيصال الدفع للمركبة ${widget.carData['plateNumber']}',
          style: TextStyle(color: Colors.white.withOpacity(0.8)),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('موافق', style: TextStyle(color: Color(0xFF43e97b))),
          ),
        ],
      ),
    );
  }
}
