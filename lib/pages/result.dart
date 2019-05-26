import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class Result extends StatefulWidget {
  @override
  _ResultState createState() => new _ResultState();
}

class _ResultState extends State<Result> {


  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return new Scaffold(
      body: Stack(
        children:<Widget>[
          Center(
            child: Image.asset(
              'images/wasi2.png',
              fit: BoxFit.cover,
              height: size.height,
            ),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),

          Container(
            padding: new EdgeInsets.all(50.0),
            child: new Form(
              child: new ListView(
                children: <Widget>[
                  Text("我輩は猫である。"),
                  Container(
                    width: size.width,
                    child: new RaisedButton(
                      child: new Text(
                        '戻る',
                        style: new TextStyle(
                          color: Colors.white
                        ),
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, '/result');
                      },
                      color: Colors.lime[700],
                    ),
                    margin: new EdgeInsets.only(
                      top: 20.0
                    ),
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );

  }
}