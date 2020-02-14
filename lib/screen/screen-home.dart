import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Random number generator
  Random _random = new Random();
  int _randomIndex = 0;

  //Array of String
  List<String> _randomSelectionArray = ["SCISSORS", "PAPER", "ROCK"];

  //Strings
  String _userSelection = "";
  String _randomSelection = "";
  String _status = "Choose your button";
  String _chosen = "";

  //SetState
  void _validator() {
    setState(
      () {
        //Random Generator
        _randomIndex = _random.nextInt(3);
        _randomSelection = _randomSelectionArray[_randomIndex];

        //String
        _chosen = "YOU: $_userSelection || AI: $_randomSelection";

        //User Winner
        if ((_userSelection == _randomSelectionArray[0]) &&
            _randomSelection == _randomSelectionArray[1]) {
          _status = "YOU WIN!";
        } else if ((_userSelection == _randomSelectionArray[1]) &&
            _randomSelection == _randomSelectionArray[2]) {
          _status = "YOU WIN!";
        } else if ((_userSelection == _randomSelectionArray[2]) &&
            _randomSelection == _randomSelectionArray[0]) {
          _status = "YOU WIN!";
        }

        //AI Winner
        if ((_randomSelection == _randomSelectionArray[0]) &&
            _userSelection == _randomSelectionArray[1]) {
          _status = "YOU LOSE!";
        } else if ((_randomSelection == _randomSelectionArray[1]) &&
            _userSelection == _randomSelectionArray[2]) {
          _status = "YOU LOSE!";
        } else if ((_randomSelection == _randomSelectionArray[2]) &&
            _userSelection == _randomSelectionArray[0]) {
          _status = "YOU LOSE!";
        }

        //DRAW
        //AI Winner
        if ((_randomSelection == _randomSelectionArray[0]) &&
            _userSelection == _randomSelectionArray[0]) {
          _status = "YOU LOSE!";
        } else if ((_randomSelection == _randomSelectionArray[1]) &&
            _userSelection == _randomSelectionArray[1]) {
          _status = "YOU LOSE!";
        } else if ((_randomSelection == _randomSelectionArray[2]) &&
            _userSelection == _randomSelectionArray[2]) {
          _status = "YOU LOSE!";
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter 101"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 280,
                height: 150,
                margin: EdgeInsets.all(25),
                color: Colors.teal,
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _status,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(_chosen)
                  ],
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.all(15),
                    color: Colors.cyan,
                    onPressed: () {
                      _userSelection = "ROCK";
                      _validator();
                    },
                    child: Text("ROCK"),
                  ),
                  SizedBox(width: 3),
                  FlatButton(
                    padding: EdgeInsets.all(15),
                    color: Colors.red,
                    onPressed: () {
                      _userSelection = "PAPER";
                      _validator();
                    },
                    child: Text("PAPER"),
                  ),
                  SizedBox(width: 3),
                  FlatButton(
                    padding: EdgeInsets.all(15),
                    color: Colors.yellow,
                    onPressed: () {
                      _userSelection = "SCISSORS";
                      _validator();
                    },
                    child: Text("SCISSORS"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
