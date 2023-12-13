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
                        setState(() {
                          ctrl.text= "%";
                          optr= "%";
                          clk =true;
                        });
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
                        setState(() {
                          ctrl.text= "/";
                          optr= "/";
                          clk =true;
                        });
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
                          if(clk)
                          {
                            num2+="7";
                            ctrl.text=num2;
                          }
                          else
                          {
                            num1+="7";
                            ctrl.text=num1;
                          }

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
                         if(clk)
                         {
                           num2+="8";
                           ctrl.text= num2;
                         }
                         else
                         {
                           num1+="8";
                           ctrl.text= num1;
                         }
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
                         if(clk)
                         {
                           num2+="9";
                           ctrl.text= num2;
                         }
                         else
                         {
                           num1+="9";
                           ctrl.text= num1;
                         }
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
                          if(clk)
                          {
                            num2+="4";
                            ctrl.text= num2;
                          }
                          else
                          {
                            num1+="4";
                            ctrl.text= num1;
                          }
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
                          if(clk)
                          {
                            num2+="5";
                            ctrl.text= num2;
                          }
                          else
                          {
                            num1+="5";
                            ctrl.text= num1;
                          }
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
                          if(clk)
                          {
                            num2+="6";
                            ctrl.text= num2;
                          }
                          else
                          {
                            num1+="6";
                            ctrl.text= num1;
                          }
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
                        setState(() {
                          ctrl.text= "-";
                          optr= "-";
                          clk =true;
                        });
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
                          if(clk)
                          {
                            num2+="1";
                            ctrl.text= num2;
                          }
                          else
                          {
                            num1+="1";
                            ctrl.text= num1;
                          }
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
                          if(clk)
                          {
                            num2+="2";
                            ctrl.text= num2;
                          }
                          else
                          {
                            num1+="2";
                            ctrl.text= num1;
                          }
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
                         if(clk)
                         {
                           num2+="3";
                           ctrl.text= num2;
                         }
                         else
                         {
                           num1+="3";
                           ctrl.text= num1;
                         }
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
                       setState(() {
                         ctrl.text= "+";
                         optr= "+";
                         clk =true;
                       });
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
                          if(clk)
                          {
                            num2+="0";
                            ctrl.text= num2;
                          }
                          else
                          {
                            num1+="0";
                            ctrl.text= num1;
                          }
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
                          if(clk)
                          {
                            num2+="00";
                            ctrl.text= num2;
                          }
                          else
                          {
                            num1+="00";
                            ctrl.text= num1;
                          }
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
                          if(clk)
                          {
                            num2+=".";
                            ctrl.text= num2;
                          }
                          else
                          {
                            num1+=".";
                            ctrl.text= num1;
                          }
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
                          if(optr== "+")
                          {
                            double res =double.parse(num1)+double.parse(num2);


                            ctrl.text = res.toString();
                          }
                          if(optr== "-")
                          {
                            double res =double.parse(num1)-double.parse(num2);

                            ctrl.text = res.toString();
                          }
                          if(optr== "*")
                          {
                            double res =double.parse(num1)*double.parse(num2);

                            ctrl.text = res.toString();
                          }
                          if(optr== "/")
                          {
                            double res =double.parse(num1)/double.parse(num2);
                            ctrl.text = res.toString();
                          }
                          if(optr== "%")
                          {
                            double a= double.parse(num1);
                            double b= double.parse(num2);
                            double res =a*b/100;
                            ctrl.text = res.toString();
                          }
                          if(optr=="√")
                          {

                            double a = double.parse(num2);
                            double res= sqrt(a);
                            ctrl.text=res.toString();
                          }
                          if(optr=="^")
                          {
                            double a = double.parse(num1);
                            double b = double.parse(num2);
                            num res=pow(a,b);
                            ctrl.text=res.toString();
                          }
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
                        setState(() {
                          ctrl.text= "√";
                          optr= "√";
                          clk =true;
                        });                      },

                          child: Text("√",
                            style: text,
                          )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          ctrl.text= "^";
                          optr= "^";
                          clk =true;
                        });
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
