import 'package:ai_analysis/src/core/theme/app_colors.dart';
import 'package:ai_analysis/src/core/theme/app_spacing.dart';
import 'package:ai_analysis/src/core/theme/app_text_styling.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/advanced_search.dart';
import 'package:ai_analysis/src/feature/Home/logout_car/widgets/header_widget.dart';
import 'package:ai_analysis/src/feature/Home/search/UI/details_car.dart';
import 'package:ai_analysis/src/feature/Home/search/controller/search_controller.dart';
import 'package:ai_analysis/src/feature/auth/data/model/ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = Get.find<SearchControllers>();
    searchController.getAllTickets();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0F172A),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(title: 'البحث'),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // حقل البحث
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        onChanged: (_) => searchController.performSearch(),
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText:
                              'البحث برقم اللوحة، اسم المالك، أو نوع السيارة...',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    // زر البحث المتقدم
                    GetBuilder<SearchControllers>(
                      builder: (controller) {
                        return GestureDetector(
                          onTap: () =>
                              controller.isAdvancedSearchExpanded.value =
                                  !controller.isAdvancedSearchExpanded.value,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(
                                  () => Icon(
                                    controller.isAdvancedSearchExpanded.value
                                        ? Icons.expand_less
                                        : Icons.expand_more,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'البحث المتقدم',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // البحث المتقدم
              AdvancedSearchSection(controller: searchController, search: true),

              // قائمة النتائج
              GetBuilder<SearchControllers>(
                builder: (controller) {
                  if (controller.isLoading) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (controller.filteredTickets.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          "لا يوجد تذاكر",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(16),
                    itemCount: controller.filteredTickets.length,
                    itemBuilder: (context, index) {
                      final ticket = controller.filteredTickets[index];
                      return TicketCard(ticket: ticket);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ويدجت لعرض كل تذكرة
class TicketCard extends StatelessWidget {
  final Ticket ticket;
  const TicketCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => DetailsCar(ticket: ticket)),
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF16213E), Color(0xFF16213E).withOpacity(0.6)],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // اسم العميل ونوع السيارة
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.directions_car,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ticket.clientName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ticket.vehicleType,
                                  style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF0f1629),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF9F43),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  ticket.vehicleNumber,
                                  style: AppTextStyling.font16W500TextInter
                                      .copyWith(fontSize: 14),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'دخول فعلي',
                                        style: AppTextStyling
                                            .font16W500TextInter
                                            .copyWith(
                                              fontSize: 12,
                                              color: AppColors.grey,
                                            ),
                                      ),
                                      SizedBox(height: AppSpacing.sm),
                                      Text(
                                        ticket.entryTime.toString(),
                                        style: AppTextStyling
                                            .font16W500TextInter
                                            .copyWith(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'رقم التذكرة ',
                                            style: AppTextStyling
                                                .font16W500TextInter
                                                .copyWith(
                                                  fontSize: 12,
                                                  color: AppColors.grey,
                                                ),
                                          ),
                                          Icon(
                                            Icons.confirmation_number,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ],
                                      ),

                                      Text(
                                        ticket.ticketNumber,
                                        style: AppTextStyling
                                            .font16W500TextInter
                                            .copyWith(
                                              fontSize: 12,
                                              color: AppColors.grey,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),

                              // أوقات الدخول والخروج
                              Row(
                                children: [
                                  Text(
                                    'الخروج المتوقع',
                                    style: AppTextStyling.font16W500TextInter
                                        .copyWith(
                                          fontSize: 12,
                                          color: AppColors.grey,
                                        ),
                                  ),
                                  Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  Spacer(),
                                  Text(
                                    'الخروج الفعلي',
                                    style: AppTextStyling.font16W500TextInter
                                        .copyWith(
                                          fontSize: 12,
                                          color: AppColors.grey,
                                        ),
                                  ),
                                  Icon(
                                    Icons.login,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ],
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(
                                    ticket.expectedExitTime?.split(" ").last ??
                                        "--:--",
                                    style: AppTextStyling.font16W500TextInter
                                        .copyWith(fontSize: 12),
                                  ),
                                  Spacer(),
                                  Text(
                                    ticket.actualExitTime.toString(),
                                    style: AppTextStyling.font16W500TextInter
                                        .copyWith(
                                          fontSize: 12,
                                          color: AppColors.grey,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),

                              // الأمانات والمفتاح
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "المفتاح",
                                        style: AppTextStyling
                                            .font16W500TextInter
                                            .copyWith(fontSize: 12),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        ticket.notes ?? "غير موجود",
                                        style: AppTextStyling
                                            .font16W500TextInter
                                            .copyWith(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.key,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Text(
                                        "الأمانات",
                                        style: AppTextStyling
                                            .font16W500TextInter
                                            .copyWith(fontSize: 12),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        ticket.amanat ?? "غير موجود",
                                        style: AppTextStyling
                                            .font16W500TextInter
                                            .copyWith(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.account_balance_wallet,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
