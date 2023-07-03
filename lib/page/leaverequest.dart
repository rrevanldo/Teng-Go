import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  var _value = "-1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new_rounded),
          title: Text('Leave request'),
          backgroundColor: fromCssColor('#77CA91'),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(18.0),
                      child: DropdownButtonFormField(
                        hint: Text('Leave type'),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey))),
                        value: _value,
                        items: [
                          DropdownMenuItem(
                              child: Text("05:00pm - 09:00pm",
                                  style: TextStyle(color: Colors.grey)),
                              value: "-1"),
                          DropdownMenuItem(
                              child: Text("05:00pm - 09:00pm",
                                  style: TextStyle(color: Colors.grey)),
                              value: "1"),
                          DropdownMenuItem(
                              child: Text("05:00pm - 09:00pm",
                                  style: TextStyle(color: Colors.grey)),
                              value: "2"),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }
}
