// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DesignBmiPage extends StatefulWidget {
  const DesignBmiPage({Key? key}) : super(key: key);

  @override
  State<DesignBmiPage> createState() => _DesignBmiPageState();
}

class _DesignBmiPageState extends State<DesignBmiPage> {
  int _weight=30;
  int _age=5;
  double height=195;
  bool isMale=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121524),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black54,
        // ignore: prefer_const_constructors
        title: Text("BMI CALCULATOR",style: TextStyle(fontSize: 25,color: Colors.white),),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child:Container(
              child: Row(
                children: [
                  Expanded(flex: 5,
                  child: InkWell(
                    onTap: () {
                     setState(() {
                       isMale=true;
                     });
                    },
                    child: Card(
                      color:isMale==true? Colors.redAccent:Colors.blueAccent,
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(Icons.male,size: 80,color: Colors.white,),
                          Text("Male",style: TextStyle(fontSize: 23,color: Colors.white),)
                        ],
                      ),
                    ),
                  )
                  ),
                  Expanded(
                    flex: 5,
                    child:  InkWell(
                      onTap: () {
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Card(
                      color: isMale==false?Colors.redAccent:Colors.blueAccent,
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(Icons.female,size: 80,color: Colors.white,),
                          Text("Female",style: TextStyle(fontSize: 23,color: Colors.white),)
                        ],
                      ),
                                      ),
                    )
                    ),
                ],
              ),
              )
              ),
          Expanded(
            flex: 3,
            child:Container(
              child: Column(
                children: [
                  Text("Height",style: TextStyle(color: Colors.white54,fontSize: 25),),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text("${height}",style: TextStyle(color: Colors.white,fontSize: 25),),
                      Text("cm",style: TextStyle(color: Colors.white54),),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                      thumbColor: Colors.blue,
                      overlayColor: Colors.blue.shade900,
                      inactiveTrackColor: Color(0xff8D8E98)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 0,
                      max: 200,
                      onChanged: (double newValue){
                        setState(() {
                          height=newValue;
                        });
                      },
                      )
                    ),
                ],
              ),
              )
              ),
          Expanded(
            flex: 3,
            child:Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Card(
                      color: Colors.black54,
                      child: Column(
                        children: [
                          Text("Weight",style: TextStyle(color: Colors.white54,fontSize: 22),),
                          Text("${_weight}",style: TextStyle(color: Colors.white,fontSize: 30),),
                          
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
                                  backgroundColor: Colors.white30,
                                  child: Icon(Icons.remove,color: Colors.white70,size: 25,),
                                 ),
                               ),
                               SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _weight++;
                                    });
                                  },
                                  child: CircleAvatar(
                                  backgroundColor: Colors.white30,
                                  child: Icon(Icons.add,color: Colors.white70,size: 25,),
                                                               ),
                                ),
                            ],
                          )

                        ],
                      ),
                    )
                    ),

                  Expanded(
                    flex: 5,
                    child: Card(
                      color: Colors.black54,
                      child: Column(
                        children: [
                          Text("Age",style: TextStyle(color: Colors.white54,fontSize: 22),),
                          Text("${_age}",style: TextStyle(color: Colors.white,fontSize: 30),)
                          ,Row(
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
                                  backgroundColor: Colors.white30,
                                  child: Icon(Icons.remove,color: Colors.white70,size: 25,),
                                 ),
                               ),
                               SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _age++;
                                    });
                                  },
                                  child: CircleAvatar(
                                  backgroundColor: Colors.white30,
                                  child: Icon(Icons.add,color: Colors.white70,size: 25,),
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
          Expanded(
            flex: 1,
            child:InkWell(
              onTap: () {
                bmi=_weight/(height*height)*10000;
                print("${bmi}");
                if(bmi<19){
                  result="You are under weight position,please focus on your food";
                }
                else if(bmi<24){
                  result="You are noramal weight,please continue it";
                }
                else{
                  result="You are over weight position,please reduce your food habit";
                }

                showDialog(
                  context: context,
                   builder: (context){
                    return Dialog(
                      child: Container(
                        height: 290,
                        width: 350,
                        color: Colors.grey,
                        child: Column(
                          children: [
                            Text("BMI CALCULATION",style: TextStyle(fontSize: 30,color: Colors.redAccent,fontWeight: FontWeight.bold),),
                            Text("BMI:${bmi}",style: TextStyle(color: Colors.black87,fontSize: 25),),
                            Text("Result:${result}",style: TextStyle(color: Colors.black87,fontSize: 25),)
                          ],
                        ),

                      ),
                    );
                   }
                   );
              },
              child: Container(
                width: double.infinity,
                color: Colors.deepOrangeAccent,
                child: Column(
                  children: [
                    Center(child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text("CALCULATE",style: TextStyle(fontSize: 16),),
                    )),
                    SizedBox(height: 5,),
                    Container(
                      height: 5,
                      width: 70,
                      color: Colors.black,
                    )
                  ],
                ),
                ),
            )
              ),
        ],
      ),
    );
    
  }
  String? result;
  var bmi; 
}