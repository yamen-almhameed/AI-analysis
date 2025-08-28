import 'package:flutter/material.dart';

class WalletCard2 extends StatelessWidget {
  final double walletBalance;
  final double totalAmount;
  const WalletCard2({super.key, required this.walletBalance, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    bool hasEnoughBalance = walletBalance >= totalAmount;
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: hasEnoughBalance ? [Color(0xFF43e97b), Color(0xFF38f9d7)] : [Color(0xFFff6b6b), Color(0xFFffa726)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: (hasEnoughBalance ? Color(0xFF43e97b) : Color(0xFFff6b6b)).withOpacity(0.3), blurRadius: 15, offset: Offset(0, 8))],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(15)),
            child: Icon(Icons.account_balance_wallet, color: Colors.white, size: 24),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('رصيد المحفظة', style: TextStyle(color: Colors.white70, fontSize: 14)),
                Text('${walletBalance.toInt()} دينار', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(20)),
            child: Text(hasEnoughBalance ? 'كافي' : 'غير كافي', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
