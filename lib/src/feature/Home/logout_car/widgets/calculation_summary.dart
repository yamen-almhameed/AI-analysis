import 'package:flutter/material.dart';

class CalculationSummary extends StatelessWidget {
  final double cashAmount;
  final double visaAmount;
  final double walletAmount;
  final double remainingAmount;
  final double excessAmount;

  const CalculationSummary({
    super.key,
    required this.cashAmount,
    required this.visaAmount,
    required this.walletAmount,
    required this.remainingAmount,
    required this.excessAmount,
  });

  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFffa726), Color(0xFFff7043)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.calculate, color: Colors.white, size: 20),
              ),
              SizedBox(width: 12),
              Text(
                'ملخص الدفعة',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          if (cashAmount > 0)
            _buildSummaryRow('نقدي', cashAmount, Color(0xFF43e97b)),
          if (visaAmount > 0)
            _buildSummaryRow('فيزا', visaAmount, Color(0xFF4facfe)),
          if (walletAmount > 0)
            _buildSummaryRow('محفظة', walletAmount, Color(0xFFf093fb)),
          if (cashAmount > 0 || visaAmount > 0 || walletAmount > 0)
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 10),
              color: Colors.white.withOpacity(0.2),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'إجمالي المدفوع',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${(cashAmount + visaAmount + walletAmount).toStringAsFixed(1)} دينار',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          if (remainingAmount > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'المبلغ المتبقي',
                  style: TextStyle(color: Colors.red.shade300, fontSize: 14),
                ),
                Text(
                  '${remainingAmount.toStringAsFixed(1)} دينار',
                  style: TextStyle(
                    color: Colors.red.shade300,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          if (excessAmount > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'الزيادة (ستضاف للمحفظة)',
                  style: TextStyle(color: Colors.green.shade300, fontSize: 14),
                ),
                Text(
                  '+${excessAmount.toStringAsFixed(1)} دينار',
                  style: TextStyle(
                    color: Colors.green.shade300,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String method, double amount, Color color) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              SizedBox(width: 8),
              Text(
                method,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Text(
            '${amount.toStringAsFixed(1)} دينار',
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
}
