import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  // Add vars and methods here
  //Adding the TextControllers from input fields
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  double _finalResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Calculate your BMI"),
          centerTitle: true,
          // background for very top and bottom
          backgroundColor: Colors.black26,
        ),
        //Add background
        backgroundColor: Colors.purple.shade600,

        //Create a container for everything
        body: new Container(
          alignment: Alignment.topCenter,
          //Create a ListView so all will stay in container and be scrollable if need be)
          child: new ListView(
              padding: const EdgeInsets.all(42.5),
              //Create a children list for ListView
              children: <Widget>[
                new Image.asset('images/strong.png',
                  height: 133.0,
                  width: 200.0,),
                //Create a new container to add a column
                new Container(
                  //margin: const EdgeInsets.all(0.0),
                    padding: const EdgeInsets.all(20.0),
                    //alignment: Alignment.center,
                    height: 400.0,
                    width: 300.0,
                    //you can see the container by adding a different color
                    color: Colors.grey.withAlpha(60),
                    //Add the column
                    //Add the children
                    child: new ListView(
                      children: <Widget>[

                        //Text field to input age
                        new TextField(
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                              labelText: 'Your Age:',
                              hintText: 'Age',
                              icon: new Icon(Icons.person_outline)
                          ),
                        ),

                        //Text field to input weight
                        new TextField(
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                              labelText: 'Your Weight in Lbs:',
                              hintText: 'Ex. 205',
                              icon: new Icon(Icons.person_add)
                          ),
                        ),
                        //Text field to input height
                        new TextField(
                          controller: _heightController,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                              labelText: 'Your Height in Feet:',
                              hintText: 'ex. 5.6',
                              icon: new Icon(Icons.person_add)
                          ),
                        ),
                        //Results area
                        new Padding(padding: new EdgeInsets.all(15.6)),

                        new Container(
                          child: new RaisedButton(
                            onPressed: null,
                            color: Colors.deepPurpleAccent,
                            child: new Text(
                              "Am I Fat?",
                              style: new TextStyle(
                                fontSize: 25.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                      ],
                    )
                ),
              ]
          ),
        )
    );
  }
}
//Add the logic methods and calculate results down here
//step 1: multiply the weight in lbs by 0.45
//step 2: multiply height in inches by 0.025 then Square it
//step3: divide step 1 by step 2.
double calculateBmiResult( String age, String weight, String height) {
  var _stepOne = int.parse(weight) * 0.45;
  var _stepTwo = int.parse(height) * 0.025;
  var _stepThree = _stepTwo * _stepTwo;
  var _endResult = _stepOne / _stepThree;
  //debugPrint(_endResult.toString());
  return _endResult;
}