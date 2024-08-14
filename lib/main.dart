import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.indigo.shade200;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Your BMI'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('BMI', style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w700
                ),),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2,
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.black45,
                          width: 1,
                        )
                    ),
                    label: Text('Enter your weight in kg', style: TextStyle(color: Colors.black),),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          color: Colors.black45,
                          width: 1,
                        )
                    ),
                    label: Text('Enter your height in feet',style: TextStyle(color: Colors.black),),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          color: Colors.black45,
                          width: 1,
                        )
                    ),
                    label: Text('Enter your height in inch',style: TextStyle(color: Colors.black),),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 15,),

                ElevatedButton(onPressed: (){

                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){

                    var intWt = int.parse(wt);
                    var intFt = int.parse(ft);
                    var intInch = int.parse(inch);

                    var tHtInM = (((intFt*12) + intInch)*2.54)/100;

                    var bmi = intWt/(tHtInM*tHtInM);

                    var msg = "";

                    if(bmi>25){
                      msg = "You're Overweight!!";
                      bgColor = Colors.red.shade200;
                    }else if(bmi<18){
                      msg = "You're Underweight!!";
                      bgColor = Colors.yellow.shade200;
                    }else{
                      msg = "You're Healthy!!";
                      bgColor = Colors.green.shade200;
                    }

                    setState((){
                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                    });

                  } else{
                    result = "Please fill all the required blanks!!";
                    setState((){});
                  }

                },
                  child: Text('Calculate', style: TextStyle(color: Colors.white),),
                  style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue)),
                ),

                SizedBox(height: 11,),

                Text(result, style: TextStyle(fontSize: 16),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}





