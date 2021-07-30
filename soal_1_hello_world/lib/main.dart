import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  String helloWorldState(String num) {
    int val = int.parse(num);
    if (val % 5 == 0 && val % 3 == 0) {
      teks = "Hello World";
    } else if (val % 3 == 0) {
      teks = "Hello";
    } else if (val % 5 == 0) {
      teks = "World";
    } else {
      teks = "angka yang anda masukkan tidak habis dibagi 3 atau 5";
    }
    return teks;
  }

  @override
  Widget build(BuildContext context) {
    Widget inputNum() {
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
                  helloWorldState(value);
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
                hintText: 'Masukkan angka',
              ),
            ),
          ),
        ],
      );
    }

    Widget outputNum() {
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
              Textcontroller.text.isEmpty
                  ? "Masukkan angka terlabih dahulu"
                  : teks,
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
          title: Text("Soal No 1"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
          child: Column(
            children: [
              outputNum(),
              SizedBox(height: 24),
              inputNum(),
            ],
          ),
        ),
      ),
    );
  }
}
