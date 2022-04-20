import 'dart:convert';
import 'package:examfinal/dataview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'fffff.dart';

void main() {
  runApp(MaterialApp(
    home: hhh(),
  ));
}

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();

  String ename = "";
  String enumber = "";
  String eemail = "";

  bool enastatus = false;
  bool enumstatus = false;
  bool eestatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
        backgroundColor: Colors.green.shade300,
      ),
      body: Column(children: [
        SizedBox(height: 20,),
        Container(
          child: TextField(
            controller: name,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                  color: Colors.blueAccent,
                ),
                labelText: "NAME",
                fillColor: Colors.white,
                filled: true,
                hintText: "name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
        ),
        SizedBox(height: 5,),
        Container(
          child: TextField(
            controller: number,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                  color: Colors.blueAccent,
                ),
                labelText: "number",
                fillColor: Colors.white,
                filled: true,
                hintText: "number",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
        ),SizedBox(height: 20,),
        Container(
          child: TextField(
            controller: email,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                  color: Colors.blueAccent,
                ),
                labelText: "email",
                fillColor: Colors.white,
                filled: true,
                hintText: "email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
        ),
        SizedBox(height: 20,),
        InkWell(
          onTap: () async {
            enastatus = false;
            enumstatus = false;
            eestatus = false;

            setState(() {});

            setState(() {
              ename = name.text;
              enumber = number.text;
              eemail = email.text;
            });
            print("yesssss");

            Map map = {
              "name": ename,
              "number": enumber,
              "email": eemail,
            };

            var url = Uri.parse(
                'https://ashwinbhaiamzon.000webhostapp.com/eprivate.php');
            var response = await http.post(url, body: map);
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');

            var res = jsonDecode(response.body);

            loginrespo rs = loginrespo.fromJson(res);

            setState(() {
              if (rs.connection == 1) {
                if (rs.result == 1) {


                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return dataview();
                    },
                  ));
                }
              }
            });
            setState(() {});
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            child: Text(
              "Submit",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            width: 220,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(12)),
          ),
        )
      ]),
    );
  }
}

class loginrespo {
  int? connection;
  int? result;

  loginrespo({this.connection, this.result});

  loginrespo.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connection'] = this.connection;
    data['result'] = this.result;
    return data;
  }
}
