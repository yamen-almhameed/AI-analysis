import 'package:ai_analysis/src/feature/Home/widgets/custom_app_bar.dart';
import 'package:ai_analysis/src/feature/Home/widgets/myUserDrawer.dart';
import 'package:ai_analysis/src/feature/Home/widgets/slider_animation.dart';
import 'package:ai_analysis/src/feature/Home/widgets/welcome_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final List<Map<String, dynamic>> services = const [
    {
      'icon': Icons.directions_car,
      'title': 'دخول المركبات',
      'subtitle': 'تسجيل دخول المركبات الجديدة',
      'gradient': [Color(0xFF667eea), Color(0xFF764ba2)],
      'route': '/registerCar',
    },
    {
      'icon': Icons.exit_to_app,
      'title': 'خروج المركبات',
      'subtitle': 'تسجيل خروج المركبات',
      'gradient': [Color(0xFFf093fb), Color(0xFFf5576c)],
      'route': '/LogOutCarsScreen',
    },
    {
      'icon': Icons.search,
      'title': 'بحث',
      'subtitle': 'البحث في قاعدة البيانات',
      'gradient': [Color(0xFF4facfe), Color(0xFF00f2fe)],
      'route': '/Search',
    },
    {
      'icon': Icons.analytics,
      'title': 'التقرير',
      'subtitle': 'عرض التقارير والإحصائيات',
      'gradient': [Color(0xFF43e97b), Color(0xFF38f9d7)],
      'route': '/ReportScreen',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: MyUserDrawer(),
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
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: FadeSlideAnimation(
                  child: CustomAppBar(scaffoldKey: scaffoldKey),
                  beginOffsetY: 0.3,
                  durationMs: 1800,
                ),
              ),
              SliverToBoxAdapter(
                child: FadeSlideAnimation(
                  child: WelcomeSection(),
                  beginOffsetY: 0.3,
                  durationMs: 1800,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(20),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => FadeSlideAnimation(
                      child: _buildServiceCard(services[index]),
                      beginOffsetY: 0.5,
                      durationMs: 1200 + index * 100,
                    ),
                    childCount: services.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> service) {
    return GestureDetector(
      onTap: () => Get.toNamed(service['route']),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: service['gradient'] as List<Color>,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: (service['gradient'] as List<Color>)[0].withOpacity(0.4),
              blurRadius: 15,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: -30,
              right: -30,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              bottom: -20,
              left: -20,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      service['icon'] as IconData,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    service['title'] as String,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  Flexible(
                    child: Text(
                      service['subtitle'] as String,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
