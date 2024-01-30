import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentBackPressTime == null ||
            DateTime.now().difference(currentBackPressTime!) > Duration(seconds: 3)) {
          currentBackPressTime = DateTime.now();
          Fluttertoast.showToast(msg: 'Press back again to exit');
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Double Back Press to Exit'),
        ),
        body: Center(
          child: Text(
            'Press back button twice to exit',
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}