import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => new _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return new Scaffold(
      body: new Center(
        child:new Container(
          width: size.width,
          child: new RaisedButton(
            child: new Text(
              'もどる',
              style: new TextStyle(
                color: Colors.white
              ),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/');
            },
            color: Colors.blue,
          ),
          margin: new EdgeInsets.only(
            top: 20.0
          ),
        ),
      ),

    );

  }
}