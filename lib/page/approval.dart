import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teng_go/page/leaverequest.dart';
import 'package:teng_go/page/overtime.dart';

class ApprovalScreen extends StatefulWidget {
  const ApprovalScreen({super.key});

  @override
  State<ApprovalScreen> createState() => _ApprovalScreenState();
}

class _ApprovalScreenState extends State<ApprovalScreen> {
  TabBar get _tabBar => TabBar(
        tabs: [
          Tab(
            child: Text('Pending', style: TextStyle(color: Colors.black)),
          ),
          Tab(
            child: Text('Approved', style: TextStyle(color: Colors.grey)),
          ),
          Tab(
            child: Text('Rejected', style: TextStyle(color: Colors.grey)),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  // Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white)),
            title: Text('Approval'),
            backgroundColor: fromCssColor('#77CA91'),
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Material(
                color: Colors.white,
                shadowColor: Colors.white,
                child: _tabBar,
              ),
            ),
          ),
          body: Stack(
            children: [
              ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ButtonBar(
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        fromCssColor('#77CA91')),
                                  ),
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (_) => Tab1(),
                                    //   ),
                                    // );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 15,
                                        right: 15),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('All',
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                            )),
                                        SizedBox(
                                          width: 50,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    side: MaterialStatePropertyAll(BorderSide(
                                        color: fromCssColor('#77CA91'))),
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white),
                                  ),
                                  onPressed: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => LeaveRequestScreen(),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 5, right: 5),
                                    child: Row(
                                      children: [
                                        Text('Leave',
                                            style: GoogleFonts.poppins(
                                              color: fromCssColor('#77CA91'),
                                            )),
                                        SizedBox(
                                          width: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    side: MaterialStatePropertyAll(BorderSide(
                                        color: fromCssColor('#77CA91'))),
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white),
                                  ),
                                  onPressed: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => OvertimeScreen(),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 5, right: 5),
                                    child: Text('Overtime',
                                        style: GoogleFonts.poppins(
                                          color: fromCssColor('#77CA91'),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Padding(
                                //   padding: EdgeInsets.only(left: 5, right: 10),
                                //   child: Icon(
                                //     Icons.search,
                                //     color: Colors.grey,
                                //   ),
                                // ),
                                Container(
                                  width: 250,
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 15),
                                    decoration: InputDecoration(
                                        hintText: "Search request",
                                        border: InputBorder.none),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.menu_sharp,
                                    color: Colors.grey,
                                  ),
                                )
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 380,
                        height: 230,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: Container(
                                      height: 55,
                                      width: 55,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          'assets/images/img.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Andy Murray has a request for",
                                      style: GoogleFonts.poppins(
                                          // fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: fromCssColor("#777777")),
                                    ),
                                    Text(
                                      "leave and it’s waiting",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: fromCssColor("#777777")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        'for your approval',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: fromCssColor("#777777")),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Date:",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: fromCssColor("#777777")),
                                ),
                                SizedBox(
                                  width: 35,
                                ),
                                Text(
                                  "2 Feb 2023 - 4 Feb 2023",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 77),
                                  child: Text(
                                    "Days:",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: fromCssColor("#777777")),
                                  ),
                                ),
                                // SizedBox(
                                //   width: 135,
                                // ),
                                Padding(
                                  padding: EdgeInsets.only(left: 34),
                                  child: Text(
                                    "2 Days",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ButtonBar(
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        side: MaterialStatePropertyAll(
                                            BorderSide(
                                                color:
                                                    fromCssColor('#77CA91'))),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white),
                                      ),
                                      onPressed: () async {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (_) =>
                                        //         LeaveRequestScreen(),
                                        //   ),
                                        // );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 5,
                                            right: 5),
                                        child: Text('Rejected',
                                            style: GoogleFonts.poppins(
                                              color: fromCssColor('#77CA91'),
                                            )),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                fromCssColor('#77CA91')),
                                      ),
                                      onPressed: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (_) => Tab1(),
                                        //   ),
                                        // );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 5,
                                            right: 5),
                                        child: Text('Approved',
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 380,
                        height: 230,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: Container(
                                      height: 55,
                                      width: 55,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          'assets/images/img.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Andy Murray has a request for",
                                      style: GoogleFonts.poppins(
                                          // fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: fromCssColor("#777777")),
                                    ),
                                    Text(
                                      "leave and it’s waiting",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: fromCssColor("#777777")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        'for your approval',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: fromCssColor("#777777")),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Date:",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: fromCssColor("#777777")),
                                ),
                                SizedBox(
                                  width: 35,
                                ),
                                Text(
                                  "2 Feb 2023 - 4 Feb 2023",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 77),
                                  child: Text(
                                    "Days:",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: fromCssColor("#777777")),
                                  ),
                                ),
                                // SizedBox(
                                //   width: 135,
                                // ),
                                Padding(
                                  padding: EdgeInsets.only(left: 34),
                                  child: Text(
                                    "2 Days",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ButtonBar(
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        side: MaterialStatePropertyAll(
                                            BorderSide(
                                                color:
                                                    fromCssColor('#77CA91'))),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white),
                                      ),
                                      onPressed: () async {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (_) =>
                                        //         LeaveRequestScreen(),
                                        //   ),
                                        // );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 5,
                                            right: 5),
                                        child: Text('Rejected',
                                            style: GoogleFonts.poppins(
                                              color: fromCssColor('#77CA91'),
                                            )),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                fromCssColor('#77CA91')),
                                      ),
                                      onPressed: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (_) => Tab1(),
                                        //   ),
                                        // );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 5,
                                            right: 5),
                                        child: Text('Approved',
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
                  )
                ],
              )
            ],
          )),
    );
  }
}
