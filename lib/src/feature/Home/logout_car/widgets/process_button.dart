import 'package:flutter/material.dart';

class ProcessButton extends StatelessWidget {
  final bool canProcess;
  final VoidCallback onPressed;

  const ProcessButton({super.key, required this.canProcess, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: canProcess ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ).copyWith(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: canProcess
                  ? [Color(0xFF43e97b), Color(0xFF38f9d7)]
                  : [Colors.grey.shade600, Colors.grey.shade700],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(vertical: 18),
          child: Center(
            child: Text(
              canProcess ? 'تأكيد الدفع' : 'يرجى إكمال المبلغ المطلوب',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
