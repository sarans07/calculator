import 'dart:math';

import 'package:flutter/material.dart';

import 'model.dart';
class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {

  final ctrl = TextEditingController();
  String num1 = "",num2 = "",optr = "";
  bool clk = false;


  void clearText()
  {
    ctrl.clear();
  }
  NumClick(String val)
  {
    if(clk)
    {
      num2+=val;
      ctrl.text=num2;
    }
    else
    {
      num1+=val;
      ctrl.text=num1;
    }
  }
  void function(String operator) {
    setState(() {
      ctrl.text = operator;
      optr = operator;
      clk = true;
    });
  }
  void calcOperation(){
    switch (optr){
      case "+":
      ctrl.text = (double.parse(num1) + double.parse(num2)).toString();
      break;
      case "-":
        ctrl.text = (double.parse(num1) - double.parse(num2)).toString();
        break;
      case "*":
        ctrl.text = (double.parse(num1) * double.parse(num2)).toString();
        break;
      case "/":
        ctrl.text = (double.parse(num1) / double.parse(num2)).toString();
        break;
      case "%":
        double result = double.parse(num1) * double.parse(num2) / 100;
        ctrl.text = result.toString();
        break;
      case "^":
        ctrl.text = pow(double.parse(num1),double.parse(num2)).toString();
        break;
      case "√":
        ctrl.text = sqrt(double.parse(num1)).toString();
        break;
      default:
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text("Calculator",
        style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 40,
        ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          Icon(Icons.more_vert)
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height*1,
          width: MediaQuery.of(context).size.width*1,
          decoration: BoxDecoration(color: Colors.black),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width*1,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.50),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 0.5,color: Colors.white10)
                  ),
                  child: TextFormField(
                    controller: ctrl,
                    //textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white10,width: 1,),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white60, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white10, width: 1),
                      ),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          num1 ="";
                          num2 ="";
                          ctrl.text="";
                        });
                      },

                          child: Text("C",
                      style: text,
                      )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        function("%");
                      },
                          child: Text("%",
                            style: text,
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        ctrl.text = ctrl.text.substring(0, ctrl.text.length-1);
                      },

                          child: Icon(Icons.arrow_back_rounded)),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                       function('/');
                      },

                          child: Text("/",
                            style: text,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          NumClick("7");
                        });
                      },
                          child: Text("7",
                            style: text,
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                       setState(() {
                        NumClick("8");
                       });
                      },

                          child: Text("8",
                            style: text,
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                       setState(() {
                         NumClick("9");
                       });
                      },
                          child: Text("9",
                            style: text,
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          ctrl.text= "*";
                          optr= "*";
                          clk =true;
                        });
                      },


                          child: Text("*",
                            style: text,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          NumClick("4");
                        });
                      },
                          child: Text("4",
                            style: text,
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          NumClick("5");
                        });
                      },
                          child: Text("5",
                            style: text,
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          NumClick("6");
                        });
                      },
                          child: Text("6",
                            style: text,
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        function('-');
                      },
                          child: Text("-",
                            style: text,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          NumClick("1");
                        });
                      },
                          child: Text("1",
                            style: text,
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          NumClick("2");
                        });
                      },
                          child: Text("2",
                            style: text,
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                       setState(() {
                         NumClick("3");
                       });
                      },
                          child: Text("3",
                            style: text,
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        function('+');
                      },
                          child: Text("+",
                            style: text,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          NumClick("0");
                        });
                      },

                          child: Text("0",
                            style: text,
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          NumClick("00");
                        });
                      },

                          child: Text("00",
                            style: text,
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          NumClick(".");
                        });
                      },
                          child: Text(".",
                            style: text,
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          calcOperation();
                        });
                      },
                          child: Text("=",
                            style: text,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        function('√');                     },

                          child: Text("√",
                            style: text,
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        function('^');
                      },

                          child: Text("^",
                            style: text,
                          )),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
