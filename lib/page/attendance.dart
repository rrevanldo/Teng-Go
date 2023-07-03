import 'dart:io';

import 'package:teng_go/page/main.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  File? _images;
  XFile? image;

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(fromCssColor('#77CA91'))),
                    onPressed: () async {
                      Navigator.pop(context);
                      final picker = ImagePicker();
                      final pickedFile =
                          await picker.getImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          _images = File(pickedFile.path);
                        });
                      }
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.image),
                        ),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(fromCssColor('#77CA91'))),
                    //if user click this button. user can upload image from camera
                    onPressed: () async {
                      Navigator.pop(context);
                      final picker = ImagePicker();
                      final pickedFile =
                          await picker.getImage(source: ImageSource.camera);
                      if (pickedFile != null) {
                        setState(() {
                          _images = File(pickedFile.path);
                        });
                      }
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.camera),
                        ),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.pop(context);
            },
          ),
          title: Text('Attendance'),
          backgroundColor: fromCssColor('#77CA91'),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    _images != null
                        ? Container(
                            width: 300,
                            height: 270,
                            margin: EdgeInsets.only(bottom: 30),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.file(
                                _images!,
                                fit: BoxFit
                                    .cover, // Ensure the image fits within the container
                              ),
                            ),
                          )
                        : Container(
                            width: 370,
                            height: 60,
                            margin: EdgeInsets.only(bottom: 30),
                            padding: EdgeInsets.only(left: 25, right: 25),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                // elevation: 10,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          'Take a selfie',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.grey),
                                        ),
                                        SizedBox(
                                          width: 75,
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.photo_camera_rounded,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            myAlert();
                                          },
                                        ),
                                      ],
                                    ))
                                  ],
                                )),
                          ),
                    Container(
                      width: 370,
                      height: 115,
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // elevation: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10),
                                      child: Text(
                                        "Jonathan Nunez",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "IT Manager",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Head Office",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )),
                                ],
                              )
                            ],
                          )),
                    ),
                    Container(
                      width: 370,
                      height: 175,
                      margin: EdgeInsets.only(bottom: 170),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // elevation: 10,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Date:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "02 Feb 2023",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Clock-In:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "--:--",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Clock-Out:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "--:--",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.green,
                                            size: 40,
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "------------",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                ],
                              )),
                            ],
                          )),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: fromCssColor('#858585'),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Attendance1(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 125, right: 125),
                        child: Text('Clock-In',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}

class Attendance1 extends StatefulWidget {
  const Attendance1({super.key});

  @override
  State<Attendance1> createState() => _Attendance1State();
}

class _Attendance1State extends State<Attendance1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.pop(context);
            },
          ),
          title: Text('Attendance'),
          backgroundColor: fromCssColor('#77CA91'),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 300,
                      height: 270,
                      margin: EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          // _images!,
                          'assets/images/img.png',
                          fit: BoxFit
                              .cover, // Ensure the image fits within the container
                        ),
                      ),
                    ),
                    Container(
                      width: 370,
                      height: 115,
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // elevation: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10),
                                      child: Text(
                                        "Jonathan Nunez",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "IT Manager",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Head Office",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )),
                                ],
                              )
                            ],
                          )),
                    ),
                    Container(
                      width: 370,
                      height: 175,
                      margin: EdgeInsets.only(bottom: 35),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // elevation: 10,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Date:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "02 Feb 2023",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Clock-In:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "--:--",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Clock-Out:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "--:--",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.green,
                                            size: 40,
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "------------",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                ],
                              )),
                            ],
                          )),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: fromCssColor('#858585'),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Attendance2(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 125, right: 125),
                        child: Text('Clock-In',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}

class Attendance2 extends StatefulWidget {
  const Attendance2({super.key});

  @override
  State<Attendance2> createState() => _Attendance2State();
}

class _Attendance2State extends State<Attendance2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.pop(context);
            },
          ),
          title: Text('Attendance'),
          backgroundColor: fromCssColor('#77CA91'),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 300,
                      height: 270,
                      margin: EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          // _images!,
                          'assets/images/img.png',
                          fit: BoxFit
                              .cover, // Ensure the image fits within the container
                        ),
                      ),
                    ),
                    Container(
                      width: 370,
                      height: 115,
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // elevation: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10),
                                      child: Text(
                                        "Jonathan Nunez",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "IT Manager",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Head Office",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )),
                                ],
                              )
                            ],
                          )),
                    ),
                    Container(
                      width: 370,
                      height: 175,
                      margin: EdgeInsets.only(bottom: 35),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // elevation: 10,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Date:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "02 Feb 2023",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Clock-In:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "--:--",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Clock-Out:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "--:--",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.green,
                                            size: 40,
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "Head Office",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                ],
                              )),
                            ],
                          )),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: fromCssColor('#77CA91'),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Attendance3(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 125, right: 125),
                        child: Text('Clock-In',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}

class Attendance3 extends StatefulWidget {
  const Attendance3({super.key});

  @override
  State<Attendance3> createState() => _Attendance3State();
}

class _Attendance3State extends State<Attendance3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.pop(context);
            },
          ),
          title: Text('Attendance'),
          backgroundColor: fromCssColor('#77CA91'),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 300,
                      height: 270,
                      margin: EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          // _images!,
                          'assets/images/img.png',
                          fit: BoxFit
                              .cover, // Ensure the image fits within the container
                        ),
                      ),
                    ),
                    Container(
                      width: 370,
                      height: 115,
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // elevation: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10),
                                      child: Text(
                                        "Jonathan Nunez",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "IT Manager",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Head Office",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )),
                                ],
                              )
                            ],
                          )),
                    ),
                    Container(
                      width: 370,
                      height: 175,
                      margin: EdgeInsets.only(bottom: 35),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // elevation: 10,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Date:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "02 Feb 2023",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Clock-In:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "08.00",
                                            style: GoogleFonts.poppins(
                                                color: fromCssColor('#388E3C'),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Clock-Out:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "--:--",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.green,
                                            size: 40,
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "Head Office",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                ],
                              )),
                            ],
                          )),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        // backgroundColor: Colors.white,
                        // shadowColor: fromCssColor('#77CA91'),
                        side: MaterialStatePropertyAll(
                            BorderSide(color: fromCssColor('#77CA91'))),
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      // style: ButtonStyle(),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Attendance4(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 125, right: 125),
                        child: Text('Clock-In',
                            style: GoogleFonts.poppins(
                              color: fromCssColor('#77CA91'),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}

class Attendance4 extends StatefulWidget {
  const Attendance4({super.key});

  @override
  State<Attendance4> createState() => _Attendance4State();
}

class _Attendance4State extends State<Attendance4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.pop(context);
            },
          ),
          title: Text('Attendance'),
          backgroundColor: fromCssColor('#77CA91'),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 300,
                      height: 270,
                      margin: EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          // _images!,
                          'assets/images/img.png',
                          fit: BoxFit
                              .cover, // Ensure the image fits within the container
                        ),
                      ),
                    ),
                    Container(
                      width: 370,
                      height: 115,
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // elevation: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10),
                                      child: Text(
                                        "Jonathan Nunez",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "IT Manager",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Head Office",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )),
                                ],
                              )
                            ],
                          )),
                    ),
                    Container(
                      width: 370,
                      height: 175,
                      margin: EdgeInsets.only(bottom: 35),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // elevation: 10,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Date:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "02 Feb 2023",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Clock-In:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "08.00",
                                            style: GoogleFonts.poppins(
                                                color: fromCssColor('#388E3C'),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Clock-Out:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "17:00",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.green,
                                            size: 40,
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "Head Office",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                ],
                              )),
                            ],
                          )),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: fromCssColor('#858585'),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Attendance5(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 125, right: 125),
                        child: Text('Clock-In',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}

class Attendance5 extends StatefulWidget {
  const Attendance5({super.key});

  @override
  State<Attendance5> createState() => _Attendance5State();
}

class _Attendance5State extends State<Attendance5> {
  final LocalAuthentication auth = LocalAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.pop(context);
            },
          ),
          title: Text('Attendance'),
          backgroundColor: fromCssColor('#77CA91'),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    // Container(
                    //   width: 300,
                    //   height: 270,
                    //   margin: EdgeInsets.only(bottom: 30),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white.withOpacity(0.5),
                    //     borderRadius: BorderRadius.circular(15.0),
                    //   ),
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(15.0),
                    //     child: Image.asset(
                    //       // _images!,
                    //       'assets/images/img.png',
                    //       fit: BoxFit
                    //           .cover, // Ensure the image fits within the container
                    //     ),
                    //   ),
                    // ),
                    Container(
                      width: 370,
                      height: 115,
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // elevation: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10),
                                      child: Text(
                                        "Jonathan Nunez",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "IT Manager",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Head Office",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )),
                                ],
                              )
                            ],
                          )),
                    ),
                    Container(
                      width: 370,
                      height: 175,
                      margin: EdgeInsets.only(bottom: 35),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // elevation: 10,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Date:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "02 Feb 2023",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Clock-In:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "--:--",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Text(
                                            "Clock-Out:",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "--:--",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 20),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.green,
                                            size: 40,
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20),
                                          child: Text(
                                            "------------",
                                            style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )),
                                    ],
                                  ),
                                ],
                              )),
                            ],
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.fingerprint_outlined,
                              color: fromCssColor('#77CA91'),
                            ),
                            iconSize: 100,
                            onPressed: () async {
                              final bool canAuthenticateWithBiometrics =
                                  await auth.canCheckBiometrics;
                              final bool canAuthenticate =
                                  canAuthenticateWithBiometrics ||
                                      await auth.isDeviceSupported();

                              // ignore: avoid_print
                              print({'Cek Support': canAuthenticate});

                              final List<BiometricType> availableBiometrics =
                                  await auth.getAvailableBiometrics();

                              print({'Cek available': availableBiometrics});

                              if (canAuthenticate) {
                                try {
                                  final bool didAuthenticate = await auth
                                      .authenticate(
                                          options: const AuthenticationOptions(
                                              biometricOnly: true),
                                          localizedReason:
                                              'Masukan sidik jari untuk tetap login',
                                          authMessages: [
                                        AndroidAuthMessages(
                                          cancelButton: 'Batalkan',
                                        )
                                      ]);
                                  print({
                                    'Cek apakah finger benar': didAuthenticate
                                  });
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MyHomePage(),
                                      ),
                                      (route) => false);
                                } on PlatformException catch (error) {
                                  print(error);
                                }
                              }
                            },
                          ),
                        ),
                        Center(
                          child: TextButton(
                            child: Text(
                              'Clock-In with your finger',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: fromCssColor('#858585'),
                              ),
                            ),
                            onPressed: () async {
                              final bool canAuthenticateWithBiometrics =
                                  await auth.canCheckBiometrics;
                              final bool canAuthenticate =
                                  canAuthenticateWithBiometrics ||
                                      await auth.isDeviceSupported();

                              // ignore: avoid_print
                              print({'Cek Support': canAuthenticate});

                              final List<BiometricType> availableBiometrics =
                                  await auth.getAvailableBiometrics();

                              print({'Cek available': availableBiometrics});

                              if (canAuthenticate) {
                                try {
                                  final bool didAuthenticate = await auth
                                      .authenticate(
                                          options: const AuthenticationOptions(
                                              biometricOnly: true),
                                          localizedReason:
                                              'Masukan sidik jari untuk tetap login',
                                          authMessages: [
                                        AndroidAuthMessages(
                                          cancelButton: 'Batalkan',
                                        )
                                      ]);
                                  print({
                                    'Cek apakah finger benar': didAuthenticate
                                  });
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MyHomePage(),
                                      ),
                                      (route) => false);
                                } on PlatformException catch (error) {
                                  print(error);
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
