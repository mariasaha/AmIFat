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
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  double bmiResult = 0.0;
  double inches = 0.0;
  String _interpret = "";

  void handleLogic() {
    setState(() {
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      inches = height * 12;

      if ((_weightController.text.isNotEmpty || weight > 0)
          && (_heightController.text.isNotEmpty || height >0)) {
        bmiResult = weight / (inches * inches) * 703;

      // Am I Fat?
      if (double.parse(bmiResult.toStringAsFixed(1)) <= 18.5) {
        _interpret = "You need to eat more!";
        print(_interpret);

      }else if (double.parse(bmiResult.toStringAsFixed(1)) >= 18.5
    && bmiResult < 25) {
        _interpret = "You are not fat, my friend. Not yet, keep eating.";
        print(_interpret);
      }else if (double.parse(bmiResult.toStringAsFixed(1)) >= 25.0) {
        _interpret = "Yes, you are fat. But you probably already knew that.";
            print(_interpret);
      }
      }
    });
  }
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
                              labelText: 'Your Height in feet:',
                              hintText: 'ex. 6.2',
                              icon: new Icon(Icons.person_add)
                          ),
                        ),
                        //Results area
                        new Padding(padding: new EdgeInsets.all(15.6)),

                        new Container(
                          alignment: Alignment.center,
                          child: new RaisedButton(
                            onPressed: handleLogic,
                                //() => debugPrint("Hello"),
                            color: Colors.purpleAccent,
                            child: new Text(
                              "Am I Fat?",
                              style: new TextStyle(
                                fontSize: 25.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text("Your BMI is: ${bmiResult.toStringAsFixed(1)}",
                            style: new TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              fontSize: 20.0
                            ),),
                            new Padding(padding: EdgeInsets.all(5.0),),
                            new Text("$_interpret",
                            style: new TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              fontSize: 20.0,
                            ))
                          ],
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
