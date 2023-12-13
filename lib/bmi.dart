import 'package:flutter/material.dart';

import 'model.dart';
class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  //TextEditingController age = TextEditingController();

  double bmi = 0;
  String bmiCategory = '';


  void calculateBMI(){
    setState(() {
      bmi = ((703*(double.parse(weight.text))/(double.parse(height.text)*double.parse(height.text))));
      // bmi = weight/((height/100)*(height/100));
      if (bmi < 18.5) {
        bmiCategory = 'Underweight';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        bmiCategory = 'Normal weight';
      } else if (bmi >= 24.9 && bmi < 29.9) {
        bmiCategory = 'Overweight';
      } else {
        bmiCategory = 'Obesity';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 30),
                TextFormField(
                  controller: weight,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ("Enter Weight in Pounds"),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    setState(() {

                    });
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: height,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ("Enter Height in Inches"),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    setState(() {

                    });
                  },
                ),
                SizedBox(height: 30),
                // TextFormField(
                //   controller: age,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: ("Enter Age"),
                //   ),
                //   keyboardType: TextInputType.number,
                //   onChanged: (value){
                //     setState(() {
                //
                //     });
                //   },
                // ),
                SizedBox(height: 30),
                ElevatedButton(onPressed: (){
                  calculateBMI();
                //   setState(() {
                //   });
                  Color dialogColor = Colors.pinkAccent; // Default color
                  if (bmiCategory == 'Normal weight') {
                    dialogColor = Colors.green;
                  } else if (bmiCategory == 'Obesity') {
                    dialogColor = Colors.red;
                  }else if (bmiCategory == 'Underweight') {
                    dialogColor = Colors.yellow;
                  }else if (bmiCategory == 'Overweight') {
                    dialogColor = Colors.pinkAccent;
                  }
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          backgroundColor: dialogColor,
                          title: Text("BMI"),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Your BMI: $bmi",
                                style: text,
                              ),
                              Text('BMI Category: $bmiCategory',
                                style: text,
                              ),
                            ],
                          ),
                        );
                      }
                  );
                },
                  child: Text("Calculate BMI",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

