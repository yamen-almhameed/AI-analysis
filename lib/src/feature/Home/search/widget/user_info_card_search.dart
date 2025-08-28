import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/auth/data/model/ticket_model.dart';
import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  final Ticket ticket;
  const UserInfoCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF9F43).withOpacity(0.8),
              Color(0xFFFFB366).withOpacity(0.6),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFFF9F43).withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    ticket.clientName,
                    style: AppTextStyling.font16W500TextInter.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    ticket.vehicleType,
                    style: AppTextStyling.font16W500TextInter.copyWith(
                      color: Colors.white54,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      '078xxxxxxxxx',
                      style: AppTextStyling.font16W500TextInter.copyWith(
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(Icons.person, color: Colors.white, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
