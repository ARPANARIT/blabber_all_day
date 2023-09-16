import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:blabber_all_day/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blabber_all_day/constants.dart';

User? loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_page';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController msgController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String messageText = '';

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser!;
      if (user != null) {
        loggedInUser = user;
        print('Logged In : ${loggedInUser?.email}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.close,
                color: Color(0xffda5c87),
              ),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
                print('this is getCurrentUser method ${loggedInUser?.email}');
              }),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder(
                stream: _firestore.collection('chitchats').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final messages = snapshot.data!.docs.reversed;

                  List<Bubble> BubbleList = [];
                  for (var msg in messages) {
                    final sender = msg.data()['sender'];
                    final text = msg.data()['text'];
                    final currentUser = _auth.currentUser!;

                    //final currentUser = loggedInUser?.email;
                    final msgBubble = Bubble(
                        text: text,
                        sender: sender,
                        isMe: currentUser.email == sender);
                    BubbleList.add(msgBubble);
                  }
                  return Expanded(
                    child: ListView(
                      reverse: true,
                      children: BubbleList,
                    ),
                  );
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: msgController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      msgController.clear();
                      if (_auth.currentUser != null) {
                        final currentUser = _auth.currentUser!;
                        print(currentUser.email);
                        _firestore.collection('chitchats').add(
                          {'text': messageText, 'sender': currentUser.email},
                        );
                      }
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
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

class Bubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;
  Bubble({required this.text, required this.sender, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10, left: 10),
          child: Text(
            sender,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              fontFamily: 'Baby',
              color: isMe ? Color(0xffda5c87) : Color(0xff9d98ca),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: isMe ? radiusMe : radiusYou,
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
