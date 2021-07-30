import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimePicker(),
    );
  }
}

class TimePicker extends StatefulWidget {
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TextEditingController Timecontroller = TextEditingController(text: '');
  TextEditingController Resultcontroller = TextEditingController(text: '');

  TimeOfDay time;
  TimeOfDay picked;

  // ignore: non_constant_identifier_names
  Future<Null> selectTime(BuildContext context) async {
    picked = await showTimePicker(
        context: context,
        initialTime: time,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
          // ignore: missing_return
        }).then((value) {
      if (value != null) {
        String period = value.period.toString().toUpperCase();
        Timecontroller.text =
            "${value.hourOfPeriod} : ${value.minute}  ${period.substring(10, 12)}";
        Resultcontroller.text = "${value.hour} : ${value.minute}";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    time = TimeOfDay.now();
    print("time : $time");
  }

  @override
  Widget build(BuildContext context) {
    Widget inputTime() {
      return Flexible(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Format 12 Jam", style: TextStyle(fontSize: 16)),
            SizedBox(
              height: 8,
            ),
            Center(
              child: TextFormField(
                readOnly: true,
                onTap: () {
                  selectTime(context);
                },
                controller: Timecontroller,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 28, bottom: 20, top: 20),
                  fillColor: Color(0xffF1F0F5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.blue[300],
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Masukkan waktu',
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget outputTime() {
      return Flexible(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Format 24 Jam", style: TextStyle(fontSize: 16)),
            SizedBox(
              height: 8,
            ),
            Center(
              child: TextFormField(
                readOnly: true,
                controller: Resultcontroller,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 28, bottom: 20, top: 20),
                  fillColor: Color(0xffF1F0F5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.blue[300],
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'hasil konversi',
                ),
              ),
            ),
          ],
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Soal 3"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Konversi Waktu",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    inputTime(),
                    SizedBox(width: 24),
                    Text("ke", style: TextStyle(fontSize: 16)),
                    SizedBox(width: 24),
                    outputTime(),
                  ],
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
