import 'package:flutter/material.dart';

class DevScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DEV'),
      ),
      //body: new Center(
        body: new ListView(
          children:[
            new Image.asset(
              'images/aa.jpg',
              height: 120.0,),
            new Align(
                alignment: Alignment.center,
                widthFactor: 2.0,
                heightFactor: 2.0,
                child: new Text(
                  "Align",
                  style: TextStyle(fontSize: 30.0,color: Color.fromARGB(255, 150, 150, 150),),),
              ),
            new Image.asset(
              'images/aa.jpg',
              height: 120.0,),
            new Align(
              alignment: Alignment.center,
              widthFactor: 2.0,
              heightFactor: 2.0,
              child: new Text(
                "Align",
                style: TextStyle(fontSize: 30.0,color: Color.fromARGB(255, 150, 150, 150),),),
            ),
            new Image.asset(
              'images/cen.jpg',
              height: 120.0,
             width: 80.0,),
            new Align(
              alignment: Alignment.center,
              widthFactor: 2.0,
              heightFactor: 2.0,
              child: new Text(
                "Xintong CEN",
                style: TextStyle(fontSize: 30.0,color: Color.fromARGB(255, 150, 150, 150),),),
            ),
          ],
        ),
      //),
    );



  }

}






