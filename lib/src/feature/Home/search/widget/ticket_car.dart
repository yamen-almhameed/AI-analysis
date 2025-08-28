import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/auth/data/model/ticket_model.dart';
import 'package:flutter/material.dart';

class TicketCar extends StatelessWidget {
  final Ticket ticket;
  const TicketCar({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'تذكرة المركبة',
              style: AppTextStyling.font16W500TextInter.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.confirmation_number,
              color: Color(0xFFFF9F43),
              size: 24,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF16213e),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF1A1A2E).withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'دخول الفعلي',
                    style: AppTextStyling.font16W500TextInter.copyWith(
                      color: AppColors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(Icons.login, size: 16, color: AppColors.grey),
                  const Spacer(),
                  Text(
                    'رقم التذكرة #',
                    style: AppTextStyling.font16W500TextInter.copyWith(
                      color: AppColors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    ticket.entryTime.toString(),
                    style: AppTextStyling.font16W500TextInter.copyWith(
                      color: AppColors.textWhite,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    ticket.ticketNumber,
                    style: AppTextStyling.font16W500TextInter.copyWith(
                      color: AppColors.textWhite,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  Icon(Icons.av_timer_rounded, size: 16, color: AppColors.grey),
                  const SizedBox(width: 10),
                  Text(
                    'خروج المتوقع',
                    style: AppTextStyling.font16W500TextInter.copyWith(
                      color: AppColors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'خروج الفعلي',
                    style: AppTextStyling.font16W500TextInter.copyWith(
                      color: AppColors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(Icons.logout, size: 16, color: AppColors.grey),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    ticket.expectedExitTime.toString(),
                    style: AppTextStyling.font16W500TextInter.copyWith(
                      color: AppColors.textWhite,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    ticket.actualExitTime.toString(),
                    style: AppTextStyling.font16W500TextInter.copyWith(
                      color: AppColors.textWhite,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color:
                          (ticket.serviceName == null ||
                              ticket.serviceName!.isEmpty)
                          ? AppColors.red.withOpacity(0.5)
                          : AppColors.green.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF1A1A2E).withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'الخدمات',
                              style: AppTextStyling.font16W500TextInter
                                  .copyWith(
                                    color:
                                        (ticket.serviceName == null ||
                                            ticket.serviceName!.isEmpty)
                                        ? AppColors.red
                                        : AppColors.green,
                                    fontSize: 14,
                                  ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              (ticket.serviceName == null ||
                                      ticket.serviceName!.isEmpty)
                                  ? 'غير موجودة'
                                  : 'موجودة',
                              style: AppTextStyling.font16W500TextInter
                                  .copyWith(
                                    color:
                                        (ticket.serviceName == null ||
                                            ticket.serviceName!.isEmpty)
                                        ? AppColors.red
                                        : AppColors.green,
                                    fontSize: 14,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.miscellaneous_services,
                          color:
                              (ticket.serviceName == null ||
                                  ticket.serviceName!.isEmpty)
                              ? AppColors.red
                              : AppColors.green,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.green.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF1A1A2E).withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'المفتاح',
                              style: AppTextStyling.font16W500TextInter
                                  .copyWith(
                                    color: AppColors.green,
                                    fontSize: 14,
                                  ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'موجود',
                              style: AppTextStyling.font16W500TextInter
                                  .copyWith(
                                    color: AppColors.green,
                                    fontSize: 14,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Icon(Icons.key, color: AppColors.green, size: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
