import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new_rounded),
          title: Text('Notification'),
          backgroundColor: fromCssColor('#77CA91'),
        ),
        body: Center(
            child: Text(
          'Notification Page',
          style: TextStyle(fontSize: 20, fontFamily: 'DancingScript'),
          // textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
        )));
  }
}
