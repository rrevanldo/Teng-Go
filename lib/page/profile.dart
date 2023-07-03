import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new_rounded),
          title: Text('Profile'),
          backgroundColor: fromCssColor('#77CA91'),
        ),
        body: Center(
            child: Text(
          'Profile Page',
          style: TextStyle(fontSize: 20, fontFamily: 'DancingScript'),
          // textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
        )));
  }
}
