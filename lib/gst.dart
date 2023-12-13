import 'package:flutter/material.dart';

import 'model.dart';
class gst extends StatefulWidget {
  const gst({super.key});

  @override
  State<gst> createState() => _gstState();
}

class _gstState extends State<gst> {

  TextEditingController main = TextEditingController();
  TextEditingController per = TextEditingController();


  double gstPersentage = 0.0;
  double igst = 0.0;
  double cgst = 0.0;
  double sgst = 0.0;
  double totalAmount = 0.0;
  double acctualAmount = 0.0;

  void calculateGST(){
    setState(() {
      igst = (acctualAmount*gstPersentage)/100;
      cgst = igst/2;
      sgst = igst/2;
      totalAmount = acctualAmount + igst;
    });
  }
 void calculateRGST(){
   setState(() {
     acctualAmount = ((double.parse(main.text)/(1+(double.parse(per.text)/100))));
     igst = double.parse(main.text)-acctualAmount;
     cgst = igst/2;
     sgst = igst/2;
   });
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GST Calculator"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: main,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ("Enter Amountt"),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    setState(() {
                      acctualAmount = double.tryParse(value)??0.0;
                    });
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: per,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ("Enter GST %")
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    setState(() {
                      gstPersentage = double.tryParse(value)??0.0;
                    });
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(onPressed: (){
                  calculateGST();
                  setState(() {
                  });
                  showModalBottomSheet(
                      context: context,
                      builder: (context){
                        return SizedBox(
                          height: MediaQuery.of(context).size.height*0.4,
                          width: MediaQuery.of(context).size.width*1,
                          child: Column(
                            children: [
                            Text("IGST: $igst",
                              style: text,
                            ),
                              Text("CGST: $cgst",
                                style: text,
                              ),
                              Text("SGST: $sgst",
                                style: text,
                              ),
                              Text("Total Amount: $totalAmount",
                                style: text,
                              ),
                            ],
                          ),
                        );
                      }
                  );
                },
                    child: Text("Calculate GST",
                    style: TextStyle(color: Colors.white),
                    ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
                ),
                ),
                SizedBox(height: 30),
                ElevatedButton(onPressed: (){
                  calculateRGST();
                  setState(() {
                  });
                  showModalBottomSheet(
                      context: context,
                      builder: (context){
                        return SizedBox(
                          height: MediaQuery.of(context).size.height*0.4,
                          width: MediaQuery.of(context).size.width*1,
                          child: Column(
                            children: [
                              Text("IGST: $igst",
                                style: text,
                              ),
                              Text("CGST: $cgst",
                                style: text,
                              ),
                              Text("SGST: $sgst",
                                style: text,
                              ),
                              Text("Acctual Amount: $acctualAmount",
                                style: text,
                              ),
                            ],
                          ),
                        );
                      }
                  );
                },
                  child: Text("Calculate IGST",
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
