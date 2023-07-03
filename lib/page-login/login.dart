import 'dart:convert';
import 'dart:math';

import 'package:teng_go/page/home.dart';
import 'package:teng_go/page/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: fromCssColor('#77CA91'),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                ),
                ListTile(
                  title: Text(
                    "Selamat Datang!",
                    style: GoogleFonts.poppins(
                      fontSize: 35,
                      color: fromCssColor('#FFFFFF'),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Silahkan menggunakan",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: fromCssColor('#FFFFFF'),
                    ),
                  ),
                  subtitle: Text(
                    "Fingerprint atau PIN Anda",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: fromCssColor('#FFFFFF'),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset('assets/images/teng-go-icon.png',
                            height: 80, width: 300),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 275,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.fingerprint_outlined,
                            color: fromCssColor('#77CA91'),
                          ),
                          iconSize: 80,
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
                      SizedBox(
                        height: 60,
                      ),
                      Center(
                        child: TextButton(
                          child: Text(
                            'Gunakan PIN',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: fromCssColor('#212121'),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Login2(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            )
          ],
        )
        // )
        );
  }
}

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  final LocalAuthentication auth = LocalAuthentication();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: fromCssColor('#346054'),
        body: Stack(
          children: [
            Form(
                child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                ),
                ListTile(
                  title: Text(
                    "Selamat Datang!",
                    style: GoogleFonts.poppins(
                      fontSize: 35,
                      color: fromCssColor('#FFFFFF'),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Silahkan menggunakan",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: fromCssColor('#FFFFFF'),
                    ),
                  ),
                  subtitle: Text(
                    "Fingerprint atau PIN Anda",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: fromCssColor('#FFFFFF'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
                Container(
                  width: 370,
                  height: 250,
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: fromCssColor('#EBEBEB'),
                      elevation: 10,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 20),
                                    Container(
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.only(left: 45, top: 10),
                                      child: Text(
                                        'Kode Akses',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 17),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                        padding: EdgeInsets.only(
                                          left: 25,
                                          bottom: 10,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          // child: Expanded(
                                          //   child:
                                          //   ),
                                          child: SizedBox(
                                            width: 250,
                                            height: 35,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 47,
                                        ),
                                        OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor:
                                                fromCssColor('#77CA91'),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => MyHomePage(),
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 5,
                                                bottom: 5,
                                                left: 90,
                                                right: 90),
                                            child: Text('Login',
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ]),
            ))
          ],
        )
        // )
        );
  }
}
