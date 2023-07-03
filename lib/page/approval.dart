import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class ApprovalScreen extends StatefulWidget {
  const ApprovalScreen({super.key});

  @override
  State<ApprovalScreen> createState() => _ApprovalScreenState();
}

class _ApprovalScreenState extends State<ApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new_rounded),
          title: Text('Approval'),
          backgroundColor: fromCssColor('#77CA91'),
        ),
        body: Center(
            child: Text(
          'Ini Text Pertama Saya saat belajar flutter. Sangat menyenangkan dapat belajar flutter dengan mudah dan menarik',
          style: TextStyle(fontSize: 20, fontFamily: 'DancingScript'),
          // textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
        )));
  }
}
