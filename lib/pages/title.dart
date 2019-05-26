import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class TitlePage extends StatefulWidget {
  @override
  _TitleState createState() => new _TitleState();
}

class _TitleState extends State<TitlePage> {
  final phraseController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //var listItem = ["one", "two", "three"];
    return new Scaffold(
      body: Stack(
        children:<Widget>[
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
<<<<<<< HEAD
            padding: new EdgeInsets.all(50.0),
            child: new Form(
              child: new ListView(
                children: <Widget>[
                  Image.asset('images/wakaiwa.png'),
                  // ListView.builder(
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Card(
                  //       child: Padding(
                  //           child: Text('$index', style: TextStyle(fontSize: 22.0),),
                  //           padding: EdgeInsets.all(20.0),),
                  //       );
                  //     },
                  //   itemCount: listItem.length,
                  // ),
                  Container(
                    width: size.width,
                    child: new RaisedButton(
                      child: new Text(
                        '変換',
                        style: new TextStyle(
                          color: Colors.white
=======
              padding: new EdgeInsets.all(50.0),
              child: new Form(
                child: new ListView(
                  children: <Widget>[
                    Image.asset('images/wakaiwa.png'),
                    new Theme(
                      data: Theme.of(context)
                          .copyWith(canvasColor: Theme.of(context).accentColor),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['E ☆ Hoshinari', 'K 米 〇kome']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      width: size.width,
                      child: new RaisedButton(
                        child: new Text(
                          '言葉を生成する',
                          style: new TextStyle(color: Colors.white),
>>>>>>> b09ec252256acb33f27d9602473fd8ebbc0a6b56
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