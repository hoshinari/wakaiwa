import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:k_paraphrase/pages/result.dart';

class Data {
  final int index;
  final String text;

  Data({
    this.index,
    this.text
  });

  Map<String, dynamic> toJson() => {
    'index': index,
    'text': text,
  };
}

class TitlePage extends StatefulWidget {
  @override
  _TitleState createState() => new _TitleState();
}

class _TitleState extends State<TitlePage> {
  List<Data> _dataList = [
    Data(index: 0, text: "E ☆ Hoshinari"),
    Data(index: 1, text: "K 米 〇kome"),
  ];
  int _index = 0;

  List<Widget> _wList() {
    List<Widget> b = [];
    b.add(Image.asset('images/wakaiwa.png'));
    b.add(Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)));
    for(var i = 0; i < _dataList.length; i++){
      b.add(
        Card(
          child: InkWell(
            onTap: (){
              setState(() {
                _index = _dataList[i].index;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Result(index: _index);
                    },
                  ),
                );
              });
            },
            child: Container(
              color: Color.fromARGB(200, 200, 20, 20),
              child: Center(
                child: Text(
                  _dataList[i].text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        )
      );
    }
    return b;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'images/wasi.png',
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
            child: new ListView(
              children: _wList()
            ),
          ),
        ],
      ),
    );
  }
}
