import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/core/theme/app_spacing.dart';
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/auth/data/model/ticket_model.dart';
import 'package:flutter/material.dart';

class RatingNotesCard extends StatelessWidget {
  final Ticket ticket;
  const RatingNotesCard({super.key, required this.ticket});
  Color getRatingColor(String rating) {
    switch (rating.toLowerCase()) {
      case 'bronze':
        return Colors.brown;
      case 'silver':
        return Colors.grey;
      case 'gold':
        return Colors.amber;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF16213e),
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'التقييم والملاحظات',
                style: AppTextStyling.font16W500TextInter.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.star, color: Colors.amber, size: 24),
            ],
          ),
          SizedBox(height: 16),
          // تقييم النجوم
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '4.5',
                style: AppTextStyling.font16W500TextInter.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 8),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < 4 ? Icons.star : Icons.star_border,
                    color: getRatingColor(ticket.statusRating),
                    size: 20,
                  );
                }),
              ),
              SizedBox(width: 8),
              Text(
                ':تقييم',
                style: AppTextStyling.font16W500TextInter.copyWith(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          _TicketNote(
            noteTitle: 'ملاحظات العميل',
            noteContent: ticket.toString(),
          ),
          SizedBox(height: AppSpacing.md),
          _TicketNote(
            noteTitle: 'ملاحظات على التذكرة',
            noteContent: ticket.notes.toString(),
          ),
          SizedBox(height: AppSpacing.md),

          _TicketNote(
            noteTitle: 'الأمانات',
            noteContent: ticket.amanat.toString(),
          ),
          SizedBox(height: AppSpacing.md),
          _TicketNote(
            noteTitle: 'موقع المفتاح',
            noteContent: ticket.notes.toString(),
          ),

          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _TicketNote extends StatelessWidget {
  final String noteTitle;
  final String noteContent;

  const _TicketNote({
    Key? key,
    required this.noteTitle,
    required this.noteContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          noteTitle,
          style: AppTextStyling.font16W500TextInter.copyWith(
            color: AppColors.grey,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 5),
        Text(
          noteContent,
          style: AppTextStyling.font16W500TextInter.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
