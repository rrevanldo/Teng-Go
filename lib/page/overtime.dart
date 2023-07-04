import 'package:teng_go/page/main.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class OvertimeScreen extends StatefulWidget {
  const OvertimeScreen({super.key});

  @override
  State<OvertimeScreen> createState() => _OvertimeScreenState();
}

class _OvertimeScreenState extends State<OvertimeScreen> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  var _value = "-1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:
                  Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white)),
          title: Text('Overtime'),
          backgroundColor: fromCssColor('#77CA91'),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    // Text("Selected Day = " + today.toString().split(" ")[0])
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: TableCalendar(
                        locale: "en_US",
                        rowHeight: 43,
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle: TextStyle(color: Colors.grey),
                        ),
                        availableGestures: AvailableGestures.all,
                        focusedDay: today,
                        selectedDayPredicate: (day) => isSameDay(day, today),
                        firstDay: DateTime.utc(2020, 12, 12),
                        lastDay: DateTime.utc(2030, 3, 14),
                        calendarStyle: CalendarStyle(
                          selectedDecoration: BoxDecoration(
                            color: fromCssColor(
                                '#77CA91'), // Set the selected day background color
                            shape: BoxShape.circle,
                          ),
                        ),
                        onDaySelected: _onDaySelected,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Text(
                              "Choose Time",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            )),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 85),
                      padding: EdgeInsets.all(18.0),
                      child: DropdownButtonFormField(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 20),
                                child: Text(
                                  today.toString().split(" ")[0],
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 20),
                                child: Text(
                                  '05:00pm - 09:00pm',
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 20),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    fromCssColor('#77CA91'))),
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Overtime2(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 12, bottom: 12, left: 30, right: 30),
                              child: Text('Submit',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}

class Overtime2 extends StatefulWidget {
  const Overtime2({super.key});

  @override
  State<Overtime2> createState() => _Overtime2State();
}

class _Overtime2State extends State<Overtime2> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  var _value = "-1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:
                  Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white)),
          title: Text('Overtime'),
          backgroundColor: fromCssColor('#77CA91'),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    // Text("Selected Day = " + today.toString().split(" ")[0])
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: TableCalendar(
                        locale: "en_US",
                        rowHeight: 43,
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle: TextStyle(color: Colors.grey),
                        ),
                        availableGestures: AvailableGestures.all,
                        focusedDay: today,
                        selectedDayPredicate: (day) => isSameDay(day, today),
                        firstDay: DateTime.utc(2020, 12, 12),
                        lastDay: DateTime.utc(2030, 3, 14),
                        calendarStyle: CalendarStyle(
                          selectedDecoration: BoxDecoration(
                            color: fromCssColor(
                                '#77CA91'), // Set the selected day background color
                            shape: BoxShape.circle,
                          ),
                        ),
                        onDaySelected: _onDaySelected,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Text(
                              "Choose Time",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            )),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(18.0),
                      child: DropdownButtonFormField(
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Time Request",
                                        style: GoogleFonts.poppins(
                                            color: fromCssColor('#858585'),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
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
                                        "Start from:",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 20),
                                      child: Text(
                                        "05:00pm",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      )),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                indent: 20,
                                endIndent: 20,
                                color: fromCssColor('#A3A3A3'),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 20),
                                      child: Text(
                                        "End:",
                                        style: GoogleFonts.poppins(
                                            color: fromCssColor('#858585'),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 20),
                                      child: Text(
                                        "09:00pm",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      )),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                indent: 20,
                                endIndent: 20,
                                color: fromCssColor('#A3A3A3'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: OutlinedButton(
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
                                              top: 10,
                                              bottom: 10,
                                              left: 150,
                                              right: 150),
                                          child: Text('Ok',
                                              style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                color: Colors.white,
                                              )),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
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
