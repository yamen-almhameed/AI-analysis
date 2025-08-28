import 'package:ai_analysis/src/feature/chat/UI/chat_screen.dart';
import 'package:flutter/material.dart';

// شاشة قائمة المحادثات
class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  List<Map<String, dynamic>> chats = [
    {
      'name': 'نور الدين محمد',
      'lastMessage': 'محمد عندمان إرسال لك....',
      'time': '9:41',
      'isOnline': true,
      'unreadCount': 0,
      'avatar': Icons.person,
      'messageType': 'text',
    },
    {
      'name': 'نور الدين محمد',
      'lastMessage': 'تم حجز عندمان إرسال لك....',
      'time': '1 دقيقة',
      'isOnline': false,
      'unreadCount': 2,
      'avatar': Icons.person_2,
      'messageType': 'booking',
    },
    {
      'name': 'نور الدين محمد',
      'lastMessage': 'محمد عندمان إرسال لك....',
      'time': '1 دقيقة',
      'isOnline': true,
      'unreadCount': 0,
      'avatar': Icons.person_3,
      'messageType': 'text',
    },
    {
      'name': 'نور الدين محمد',
      'lastMessage': 'محمد عندمان إرسال لك....',
      'time': '1 دقيقة',
      'isOnline': false,
      'unreadCount': 1,
      'avatar': Icons.person_4,
      'messageType': 'text',
    },
    {
      'name': 'مجموعة العمل',
      'lastMessage': 'محمد عندمان إرسال لك....',
      'time': '1 دقيقة',
      'isOnline': true,
      'unreadCount': 0,
      'avatar': Icons.group,
      'messageType': 'text',
    },
    {
      'name': 'نور الدين محمد',
      'lastMessage': 'محمد عندمان إرسال لك....',
      'time': '1 دقيقة',
      'isOnline': false,
      'unreadCount': 0,
      'avatar': Icons.person,
      'messageType': 'text',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E),
      body: Column(
        children: [
          // Header
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFF9F43), Color(0xFFFFB366)],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFF8F0),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.person,
                                color: Color(0xFF16213E),
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 12),
                        Column(
                          children: [
                            Text(
                              'أحمد حمدان',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'موظف المواقف',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    Text(
                      'الرسائل',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // قائمة المحادثات
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF16213E),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            userName: chat['name'],
                            isOnline: chat['isOnline'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color(0xFF1A1A2E),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // الوقت والحالة
                          Column(
                            children: [
                              Text(
                                chat['time'],
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 5),
                              if (chat['messageType'] == 'booking')
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF9F43),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.local_taxi,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                )
                              else
                                Icon(
                                  Icons.done_all,
                                  color: chat['isOnline']
                                      ? Color(0xFF27AE60)
                                      : Colors.grey,
                                  size: 16,
                                ),
                            ],
                          ),
                          SizedBox(width: 15),

                          // محتوى المحادثة
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // عداد الرسائل غير المقروءة
                                    if (chat['unreadCount'] > 0)
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFF9F43),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Text(
                                          '${chat['unreadCount']}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    else
                                      SizedBox.shrink(),

                                    // اسم المستخدم
                                    Text(
                                      chat['name'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  chat['lastMessage'],
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 15),

                          // صورة المستخدم
                          Stack(
                            children: [
                              Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFF9F43),
                                      Color(0xFFFFB366),
                                    ],
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFF8F0),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    chat['avatar'],
                                    color: Color(0xFF16213E),
                                    size: 28,
                                  ),
                                ),
                              ),
                              if (chat['isOnline'])
                                Positioned(
                                  bottom: 2,
                                  right: 2,
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF27AE60),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xFF1A1A2E),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
