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

class Response {
  final String sentence;

  Response({
    this.sentence
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      sentence: json['sentence'],
    );
  }
}
class Result extends StatefulWidget {
  @override
  _ResultState createState() => new _ResultState();
}

class _ResultState extends State<Result> {
  String _secntence = "";

  @override
  void initState(){
    super.initState();
    _requestToAPI(1).then((Response r){
      setState(() {
        _secntence = r.sentence;
      });
    });
  }

  Future<Response> _requestToAPI(int index) async {
    var url = "$_baseURL";
    var request = new Request(index: index);
    final response = await http.post(url,
      body: jsonEncode(request.toJson()),
      headers: {
        "Content-Type": "application/json",
      }
    );
    if (response.statusCode == 200) {
      return Response.fromJson(jsonDecode(response.body));
    } else {
      return new Response();
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
                  Text(_secntence),
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
                        Navigator.pushNamed(context, '/title');
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