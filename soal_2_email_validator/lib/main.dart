import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController Textcontroller = TextEditingController(text: '');

  bool valid = false;

  bool isValid(String text) {
    RegExp _email = RegExp(r'\w{0,20}\@\w+(\.id|\.co\.id)');
    String email = _email.stringMatch(text).toString();
    valid = (email == text) ? true : false;
    return valid;
  }

  @override
  Widget build(BuildContext context) {
    Widget inputEmail() {
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
                  isValid(value);
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
                hintText: 'Masukkan email',
              ),
            ),
          ),
        ],
      );
    }

    Widget outputEmail() {
      return Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: valid ? Colors.blueAccent : Colors.redAccent),
              color: valid ? Color(0xffE5EDF6) : Color(0xffF3D6D6)),
          child: Center(
            child: Text(
              valid ? "Email memenuhi syarat" : "Email tidak memenuhi syarat",
              style: TextStyle(
                  fontSize: 20,
                  color: valid ? Colors.blue : Colors.red,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Soal No 2"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
          child: Column(
            children: [
              outputEmail(),
              SizedBox(height: 24),
              inputEmail(),
            ],
          ),
        ),
      ),
    );
  }
}
