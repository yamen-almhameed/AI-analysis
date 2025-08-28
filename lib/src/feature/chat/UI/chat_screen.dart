import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String userName;
  final bool isOnline;

  ChatScreen({required this.userName, required this.isOnline});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  List<Map<String, dynamic>> messages = [
    {'text': 'السلام عليكم..', 'isMe': false, 'time': '9:41', 'type': 'text'},
    {
      'text': 'مرحباً قال فضلاً سيدي الكترونيات بالقرب',
      'isMe': true,
      'time': '9:42',
      'type': 'text',
    },
    {
      'text': 'شكراً لك سأفق الطريق',
      'isMe': false,
      'time': '9:43',
      'type': 'text',
    },
    {'text': 'جديد.', 'isMe': true, 'time': '9:44', 'type': 'text'},
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
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),

                    // أيقونات الاتصال
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.call,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.videocam,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),

                    // معلومات المستخدم
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.userName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.isOnline
                              ? 'متصل الآن'
                              : 'آخر ظهور منذ 5 دقائق',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 12),

                    // صورة المستخدم
                    Stack(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
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
                            size: 25,
                          ),
                        ),
                        if (widget.isOnline)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Color(0xFF27AE60),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xFFFF9F43),
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
            ),
          ),

          // منطقة الرسائل
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
                padding: EdgeInsets.all(20),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return _buildMessageBubble(message);
                },
              ),
            ),
          ),

          // حقل الرسالة
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF16213E),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  // زر الإرسال
                  GestureDetector(
                    onTap: _sendMessage,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFF9F43), Color(0xFFFFB366)],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFF9F43).withOpacity(0.4),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(Icons.send, color: Colors.white, size: 20),
                    ),
                  ),
                  SizedBox(width: 10),

                  // حقل النص
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF1A1A2E),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Color(0xFFFF9F43).withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: messageController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'اكتب رسالتك...',
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          // أيقونات إضافية
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.attach_file,
                                  color: Colors.white.withOpacity(0.6),
                                  size: 20,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.emoji_emotions,
                                  color: Colors.white.withOpacity(0.6),
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    final isMe = message['isMe'] as bool;
    return Container(
      margin: EdgeInsets.only(
        bottom: 15,
        left: isMe ? 0 : 50,
        right: isMe ? 50 : 0,
      ),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe) ...[
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF9F43), Color(0xFFFFB366)],
                ),
                shape: BoxShape.circle,
              ),
              child: Container(
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF8F0),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person, color: Color(0xFF16213E), size: 20),
              ),
            ),
            SizedBox(width: 10),
          ],

          Flexible(
            child: Column(
              crossAxisAlignment: isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    gradient: isMe
                        ? LinearGradient(
                            colors: [Color(0xFFFF9F43), Color(0xFFFFB366)],
                          )
                        : null,
                    color: isMe ? null : Color(0xFF1A1A2E),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(isMe ? 20 : 5),
                      bottomRight: Radius.circular(isMe ? 5 : 20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    message['text'],
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    textAlign: isMe ? TextAlign.right : TextAlign.left,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isMe) ...[
                      Icon(Icons.done_all, color: Color(0xFF27AE60), size: 16),
                      SizedBox(width: 5),
                    ],
                    Text(
                      message['time'],
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.add({
          'text': messageController.text,
          'isMe': true,
          'time':
              '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
          'type': 'text',
        });
        messageController.clear();
      });

      // محاكاة رد تلقائي
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          messages.add({
            'text': 'شكراً لك',
            'isMe': false,
            'time':
                '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
            'type': 'text',
          });
        });
      });
    }
  }
}
