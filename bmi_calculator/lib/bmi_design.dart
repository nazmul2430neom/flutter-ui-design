// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BmiDesign extends StatefulWidget {
  const BmiDesign({Key? key}) : super(key: key);

  @override
  State<BmiDesign> createState() => _BmiDesignState();
}

class _BmiDesignState extends State<BmiDesign> {
  double height=195;
  int _weight=30;
  int _age=5;
  bool isMale=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0f1e21),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black45,
        title: Text("BMI CALCULATOR",style: TextStyle(fontSize: 25),),
      ),
      body: Column(
        children: [
          Expanded(
            flex:5,
            child:Container(
            child: Row(
              children: [
                Expanded(
                  flex:5,
                  child: Container(
                    child: InkWell(
                      onTap: (() {
                        setState(() {
                          isMale=true;
                        });
                      }),
                      child: Card(
                        color: isMale==true?Colors.redAccent:Colors.blue,
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Icon(Icons.male,color: Colors.white,size: 80,),
                            ),
                            Text("Male",style: TextStyle(color: Colors.white,fontSize: 25),),
                          ],
                        ),
                      ),
                    ),
                  )),
                Expanded(flex:5,
                child: Container(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isMale=false;
                      });
                    },
                    child: Card(
                        color: isMale==false?Colors.redAccent:Colors.blue,
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Icon(Icons.female,color: Colors.white,size: 80,),
                            ),
                            Text("Female",style: TextStyle(color: Colors.white,fontSize: 25),),
                          ],
                        ),
                      ),
                  ),
                )
                ),
              ],
            ),
          )),
          
          Expanded(
            flex:5,
            child:Container(
               child: Column(
                children: [
                  Text("Height",style: TextStyle(fontSize: 25,color: Colors.white70),),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    
                    children: [
                      Text("${height}",style: TextStyle(fontSize: 30,color: Colors.white70,fontWeight: FontWeight.w900),),
                      Text("cm",style: TextStyle(color: Colors.white70),)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                     overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 0,
                      max: 200,
                       onChanged: (double newValue){
                        setState(() {
                          height=newValue;
                        });
                       }
                       )
                    )

                ],
               ),
            ),
            ),

          Expanded(
            flex:5,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Card(
                      color: Colors.black,
                      child: Column(
                        children: [
                          Text("Weight",style: TextStyle(color: Colors.white54,fontSize: 20),),
                          Text("${_weight}",style: TextStyle(fontSize: 40,color: Colors.white),),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _weight--;
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundColor: Color.fromARGB(255, 64, 66, 66),
                                  child: Icon(Icons.remove),
                                ),
                              ),

                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _weight=_weight+1;
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundColor: Color.fromARGB(255, 64, 66, 66),
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),


                        ],
                      ),
                    )
                    ),
                  Expanded(
                    flex: 5,
                    child: Card(
                      color: Colors.black,
                      child: Column(
                        children: [
                           Text("Age",style: TextStyle(fontSize: 20,color: Colors.white54),),
                           Text("${_age}",style: TextStyle(color: Colors.white,fontSize: 40),),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              InkWell(
                                onTap: () {
                                  if(_age>0){
                                    setState(() {
                                      _age--;
                                    });
                                  }
                                },
                                child: CircleAvatar(
                                  backgroundColor: Color.fromARGB(255, 64, 66, 66),
                                  child: Icon(Icons.remove),
                                ),
                              ),

                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _age++;
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundColor: Color.fromARGB(255, 64, 66, 66),
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ],
                           )

                        ],
                      ),

                    )
                    ),
                ],
              ),
            )
            ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                bmi=_weight/(height*height)*10000;
                print("${bmi}");

                if(bmi<19){
                  result="You are under Weight Position,please focus on your food";
                }
                else if(bmi<24){
                  result="You are Normal Weight,please continue it";
                }
                else{
                  result="You are over weight position,please balance it";
                }

                showDialog(
                  context: context,
                 builder:(context){
                   return Dialog(
                    child: Container(
                      height: 290,
                      width: 370,
                      color: Colors.grey,
                      child: Column(
                        children: [
                            Text("BMI:${bmi}",style: TextStyle(fontSize: 25,color: Colors.black87),),
                            Text("Result:${result}",style: TextStyle(fontSize: 25,color: Colors.black87),),
                        ],
                      ),
                    ),
                   );
                 }
                 );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Color(0xffbf372a),
                child: Column(
                  children: [
                    Center(child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text("CALCULATE",style: TextStyle(fontSize: 16),),
                    )),
                    SizedBox(height: 5,),
                    Container(
                      height: 5,
                      width: 60,
                      color: Colors.black,
                    )
                  ],
                )
              ),
            ),
          )
        ],
      ),
    );
    
  }
    String? result;
    var bmi;
}