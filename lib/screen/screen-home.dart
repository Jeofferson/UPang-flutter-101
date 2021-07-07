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
        if ((_randomSelection == _randomSelectionArray[0]) &&
            _userSelection == _randomSelectionArray[0]) {
          _status = "DRAW!";
        } else if ((_randomSelection == _randomSelectionArray[1]) &&
            _userSelection == _randomSelectionArray[1]) {
          _status = "DRAW!";
        } else if ((_randomSelection == _randomSelectionArray[2]) &&
            _userSelection == _randomSelectionArray[2]) {
          _status = "DRAW!";
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar and title
      appBar: AppBar(
        title: Text("Flutter 101"),
      ),
      //Container - is a convenience widget that combines common painting, positioning, and sizing widgets
      body: Container(
        //EdgeInsets -  An immutable set of offsets in each of the four cardinal directions.
        margin: EdgeInsets.all(10),
        // Center - Putting it in the middle
        // Child - for single widget
        child: Center(
          //Column - create a vertical array of widgets
          child: Column(
            // MainAxisAlignment - Horizontal Alignement
            mainAxisAlignment: MainAxisAlignment.center,
            // Children - Multiple Widget
            children: <Widget>[
              Container(
                width: 280,
                height: 150,
                margin: EdgeInsets.all(25),
                // Colors.<color> - Fixed/static colors/ default colors from the project
                // Color(0xFF<xxxxxx>) - for Hexadecimal Colors
                color: Colors.teal,
                child: Center(
                    child: Column(
                  // MainAxisAlignment - Horizontal Alignement
                  // CorssAxisAlignment - Vertical Alignement
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Text - Label
                    Text(
                      _status, // String value here
                      textAlign: TextAlign.center, // TextAlignment
                      //TextStyle - text can change fonts,size, weight and more
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(_chosen)
                  ],
                )),
              ),
              //Row - create a horizontal array of widgets
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // FlatButton - is a text label displayed on a (zero elevation) Material widget that reacts to touches by filling with color.
                  FlatButton(
                    padding: EdgeInsets.all(15),
                    color: Colors.cyan,
                    //onPressed - Action when pressing
                    onPressed: () {
                      _userSelection = "ROCK";
                      //setState - this are is calling setState named "_validator". Basically,notifies
                      // the framework that the internal state of this object has changed in a way that
                      // might impact the user interface in this subtree, which causes the framework to
                      // schedule a build for this State object
                      _validator();
                    },
                    child: Text("ROCK"),
                  ),
                  // widget view in flutter is used to create box with specified width and height.
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
