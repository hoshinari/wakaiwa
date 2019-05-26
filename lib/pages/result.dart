import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

var _baseURL = "https://whispering-plateau-33721.herokuapp.com/";

class Request {
  final int index;

  Request({
    this.index,
  });

  Map<String, dynamic> toJson() => {
    'index': index,
  };
}
class Result extends StatefulWidget {
  final int index;

  Result({this.index});
  @override
  _ResultState createState() => new _ResultState(index: index);
}

class _ResultState extends State<Result> {
  String _secntence = "";
  final int index;

  _ResultState({this.index});

  @override
  void initState(){
    super.initState();
    _requestToAPI(index).then((String sentence){
      setState(() {
        _secntence = sentence;
      });
    });
  }

  Future<String> _requestToAPI(int index) async {
    var url = "$_baseURL";
    var request = new Request(index: index);
    final response = await http.post(url,
      body: jsonEncode(request.toJson()),
      headers: {
        "Content-Type": "application/json",
      }
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
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
                  Text(
                    _secntence,
                    style: TextStyle(
                      fontFamily:'Noto_Serif_JP',
                    ),
                  ),
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
                        Navigator.pushNamed(context, '/');
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