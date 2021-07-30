import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool palindrom = false;

  TextEditingController Textcontroller = TextEditingController(text: '');

  bool isPalindrom(String text) {
    var arr = text.split(' ');
    var dum = [];
    print(arr);

    for (var i = 0; i < arr.length; i++) {
      var reversed = arr[i].split('').reversed.join();
      if (reversed == arr[i]) {
        dum.add(arr[i]);
      }
    }

    palindrom = (dum[0] == dum[1]) ? true : false;
    print(palindrom);

    return palindrom;
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
                  isPalindrom(value);
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

    Widget result() {
      return Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blueAccent),
              color: Color(0xffE5EDF6)),
          child: Center(
            child: Text(
              palindrom
                  ? "kalimat tersebut termasuk palindrom"
                  : "kalimat tersebut tidak termasuk palindrom",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
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
          title: Text("Soal No 5"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
          child: Column(
            children: [
              inputText(),
              SizedBox(height: 24),
              Textcontroller.text.isEmpty ? Container() : result(),
            ],
          ),
        ),
      ),
    );
  }
}
