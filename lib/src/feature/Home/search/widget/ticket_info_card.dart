import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:flutter/material.dart';

class TicketInfoCard extends StatelessWidget {
  const TicketInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'تذكرة المركبة',
                style: AppTextStyling.font16W500TextInter
                    .copyWith(color: Colors.white),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.confirmation_number,
                color: Color(0xFFFF9F43),
                size: 24,
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}