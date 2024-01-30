import 'package:flutter/material.dart';
import 'package:saran_calculator/bmi.dart';
import 'package:saran_calculator/gst.dart';
import 'package:saran_calculator/calculator.dart';
import 'package:fluttertoast/fluttertoast.dart';
class cal extends StatefulWidget {
  const cal({super.key});

  @override
  State<cal> createState() => _calState();
}

class _calState extends State<cal> {

  DateTime? currentBackPressTime;


  int _currentIndex = 0;
  List pages = [
    calculator(),
    gst(),
    bmi(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentBackPressTime == null ||
            DateTime.now().difference(currentBackPressTime!) > Duration(seconds: 5)) {
          currentBackPressTime = DateTime.now();
          Fluttertoast.showToast(msg: 'Press back again to exit');
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar:
          BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined),
                label: 'Calculator'),
            BottomNavigationBarItem(icon: Icon(Icons.calculate_rounded),
            label: 'GST'
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person),
                label: 'BMI'
            ),
          ],

        ),
      ),
    );
  }
}
