import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Auto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AutoState();
  }
}

class _AutoState extends State<Auto> {
  Color _myColor = Colors.green;
  Color _farbeBox = Colors.green;
  String _buttonText = 'Start';
  var _zeitGestartet = 'Gestartet: ';
  var _zeitGestoppt = 'Gestoppt: ';
  var data;
String displayedsring = "";

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "http://api.timezonedb.com/v2/get-time-zone?key=3NEWA7XBCFKW&format=json&by=zone&zone=Europe/Berlin"),
        headers: {"Accept": "application/json"});
    data = JSON.decode(response.body);
      setState(() {
        displayedsring = data["formatted"];
      });
    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(' '),
          new Text(' '),
          new Text(' '),
          new RaisedButton(
              padding: EdgeInsets.all(50.0),
              child: new Text(_buttonText,
                  style: new TextStyle(
                      fontSize: 50.0, fontWeight: FontWeight.bold)),
              color: _farbeBox,
              onPressed: () { getData;
                setState(() {
                  if (_myColor == Colors.red) {
                    _myColor = Colors.green;
                    _farbeBox = Colors.green;
                    _buttonText = "Start";
                    _zeitGestoppt = 'Gestoppt: ' + displayedsring;
                    final snackBar = new SnackBar(
                        content: new Text('Zeiterfassung beendet'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  } else {
                    _myColor = Colors.red;
                    _farbeBox = Colors.red;
                    _buttonText = "Ende";
                    _zeitGestartet = 'Gestartet: ' + displayedsring;
                    final snackBar = new SnackBar(
                        content: new Text('Zeiterfassung gestartet'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
                });
              }),
          new Text(' '),
          new Text(' '),
          new Text(' '),
          new Text(' '),
          new Text(
            _zeitGestartet,
            style: new TextStyle(fontSize: 23.0),
          ),
          new Text(' '),
          new Text(' '),
          new Text(
            _zeitGestoppt,
            style: new TextStyle(fontSize: 23.0),
          ),
          new Text(' '),
          new Text(' '),
          new Text(' '),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new RaisedButton(
                  color: Colors.red,
                  child: new Text(
                    'Löschen',
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.all(30.0),
                  onPressed: () {
                    print('Löschen');
                  },
                ),
              ),
              new Expanded(
                child: new RaisedButton(
                  color: Colors.blue,
                  child: new Text(
                    'Speichern',
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.all(30.0),
                  onPressed: () {
                    print('Speichern');
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
