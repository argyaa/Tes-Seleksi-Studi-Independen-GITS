import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String teks = "";
  TextEditingController Textcontroller = TextEditingController(text: '');
  TextEditingController reverseController = TextEditingController(text: '');

  String reverse(String text) {
    String input = text; // Music 𝄞 for the win
    teks = input.split('').reversed.join();
    return teks;
  }

  @override
  Widget build(BuildContext context) {
    Widget inputText() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          Center(
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  reverse(value);
                  reverseController.text = teks;
                });
              },
              controller: Textcontroller,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 28, bottom: 20, top: 20),
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
                hintText: 'Masukkan kalimat',
              ),
            ),
          ),
        ],
      );
    }

    Widget reverseText() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hasil reverse",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: TextFormField(
              readOnly: true,
              controller: reverseController,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 28, bottom: 20, top: 20),
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
                hintText: 'Hasil reverse',
              ),
            ),
          ),
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Soal No 4"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
          child: Column(
            children: [
              inputText(),
              SizedBox(height: 24),
              reverseText(),
            ],
          ),
        ),
      ),
    );
  }
}
