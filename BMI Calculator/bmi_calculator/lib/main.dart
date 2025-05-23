import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF13a888),
      ),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height = 170.0;
  double _weight = 79.0;
  int _bmi = 0;
  String _condition = 'Select Data';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              height: size.height * 0.40,
              width: double.infinity,
              decoration: new BoxDecoration(color: Color(0xFF13a888)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 60),
                  ),
                  Text(
                    'Calculator',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text(
                        '$_bmi',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Condition :',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          children: <TextSpan>[
                        TextSpan(
                          text: '$_condition ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ]))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: size.height*0.03,),
                  Text(
                    'Choose Data',
                    style: TextStyle(
                        color: Color(0xFF13a888),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(height: size.height*0.03,),
                  RichText(
                      text: TextSpan(
                          text: 'Height :',
                          style: TextStyle(
                            color: Color(0xFF043f3d),
                            fontSize: 15,
                          ),
                          children: <TextSpan>[
                        TextSpan(
                          text: '$_height',
                          style: TextStyle(
                            color: Color(0xFF043f3d),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ])),
                      SizedBox(height: size.height*0.03,),
                      Slider(
                        value: _height,
                        min: 0,
                        max: 250,
                        onChanged: (height) {
                          setState(() {
                            _height = height;
                          }); 
                        },
                        divisions: 250,
                        label: "$_height",
                        activeColor: Color(0xFF043f3d),
                      ),
                      SizedBox(height: size.height*0.03,),
                      RichText(
                      text: TextSpan(
                          text: 'Weight :',
                          style: TextStyle(
                            color: Color(0xFF043f3d),
                            fontSize: 15,
                          ),
                          children: <TextSpan>[
                        TextSpan(
                          text: '$_weight ',
                          style: TextStyle(
                            color: Color(0xFF043f3d),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ])),
                      SizedBox(height: size.height*0.03,),
                      Slider(
                        value: _weight,
                        min: 0,
                        max: 300,
                        onChanged: (weight) {
                          setState(() {
                            _weight = weight;
                          }); 
                        },
                        divisions: 300,
                        label: "$_weight",
                        activeColor: Color(0xFF043f3d),
                      ),
                      SizedBox(height: size.height*0.03,),
                      Container(
                        width: size.width*0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                _bmi = (_weight /((_height/100)*(_height/100))).round().toInt();
                                if(_bmi>=18.5 && _bmi <=25) {_condition ='Normal';}
                                else if(_bmi>25 && _bmi <=30) {_condition ='OverWeight';}
                                else if(_bmi>30) {_condition ='Obesity';}
                                else {_condition='UnderWeight';}
                              });
                            },
                            child: Text('Calculate',style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,),
                          ),
                          backgroundColor: Color(0xFF13a888),
                          splashColor:Color(0xFF043f3d) ,
                        ),
                      )
                      )
                ],
              ),
              
            )
          ],
        ),
      ),
    );
  }
}
