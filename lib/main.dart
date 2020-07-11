import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class BackChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Changing Background",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var colors = [
    Colors.teal,
    Colors.yellow,
    Colors.amber,
    Colors.blueAccent,
    Colors.grey,
    Colors.orange,
    Colors.purple,
    Colors.primaries,
    Colors.redAccent,
  ];

  var currentColor = Colors.white;
  var currentButtonColor = Colors.black;

  // For the timer
  Timer _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            _start = 10;
            startTimer();
          } else {
            _start = _start - 1;
            changeColor(_start);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  int index;
  Color colorrightNow;
  void changeColor(int _start) {
    setState(() {
      // index = Random().nextInt(colors.length);
      currentColor = colors[_start];
    });
  }

  void changeBackground() {
    int random = Random().nextInt(colors.length);
    int randomButtonColor = Random().nextInt(colors.length);
    setState(() {
      currentColor = colors[random];
      currentButtonColor = colors[randomButtonColor];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: currentColor,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: currentButtonColor,
                  child: Text(
                    "Change Me",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
                  onPressed: changeBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: currentButtonColor,
                  child: Text(
                    "AutoChange",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
                  onPressed:(){ startTimer();},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

void main() => runApp(BackChange());
