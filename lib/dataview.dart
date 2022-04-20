import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class dataview extends StatefulWidget {
  const dataview({Key? key}) : super(key: key);

  @override
  State<dataview> createState() => _dataviewState();
}

class _dataviewState extends State<dataview> {

  viewresponse? ps;
  String? id;
  String name = "";
  String number = "";
  String email = "";
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewdata();
  }

  Future<void> viewdata() async {
    var url = Uri.parse('https://ashwinbhaiamzon.000webhostapp.com/view.php');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var pes = jsonDecode(response.body);
    ps = viewresponse.fromJson(pes);
    setState(() {

    });

    setState(() {
      if (ps!.connection == 1) {

        if (ps!.result == 1) {

          status = true;

          print("==$status===${ps!.productdata![1].email}");
  setState(() {

  });
        } else {
          status = false;

        }
      }
    });

    print("id===$id");
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: status?GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: ps!.productdata!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                color: Colors.red.shade100,
                alignment: Alignment.center,
                height: 40,
                width: twidth,
                child: Text(
                  "${ps!.productdata![index].name}",
                  style: TextStyle(fontSize: 25, color: Colors.deepPurple),
                ),
              ),
              Container(
                color: Colors.green.shade100,
                alignment: Alignment.center,
                height: 40,
                width: twidth,
                child: Text(
                  "${ps!.productdata![index].number}",
                  style: TextStyle(fontSize: 25, color: Colors.deepPurple),
                ),
              ),
              Container(
                color: Colors.purple.shade100,
                alignment: Alignment.center,
                height: 40,
                width: twidth,
                child: Text(
                  "${ps!.productdata![index].email}",
                  style: TextStyle(fontSize: 25, color: Colors.deepPurple),
                ),
              ),
            ],
          );
        },
      ):Center(child: CircularProgressIndicator()),
    );
  }
}

class viewresponse {
  int? connection;
  int? result;
  List<Productdata>? productdata;

  viewresponse({this.connection, this.result, this.productdata});

  viewresponse.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    result = json['result'];
    if (json['productdata'] != null) {
      productdata = <Productdata>[];
      json['productdata'].forEach((v) {
        productdata!.add(new Productdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connection'] = this.connection;
    data['result'] = this.result;
    if (this.productdata != null) {
      data['productdata'] = this.productdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Productdata {
  String? id;
  String? name;
  String? number;
  String? email;

  Productdata({this.id, this.name, this.number, this.email});

  Productdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    data['email'] = this.email;
    return data;
  }
}
