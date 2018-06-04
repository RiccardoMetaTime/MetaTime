import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Kunden extends StatefulWidget {
  @override
  KundenPageState createState() => new KundenPageState();
}

class KundenPageState extends State<Kunden> {

  var data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("http://192.168.178.55:5000/api/kunden"),
      headers: {
        "Accept": "application/json",
        "X-Auth-Token": "809ebe22-4ac1-416b-9fbf-ef5ec85303a1"
      }
    );
  print(response.body);
    this.setState(() {
      data = JSON.decode(response.body);
    });
  
    
    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Kunden"),
      ),
      body: new ListView(
        children: <Widget>[
          new Text(data["kunden"])
        ],
      )
    );
  }
}