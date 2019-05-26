import 'package:flutter/material.dart';
import 'package:wakaiwa/pages/title.dart';
import 'package:wakaiwa/pages/result.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'K_Phrase',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => new TitlePage(),
        '/result': (_) => new Result(),
      },
      theme: new ThemeData(
        primaryColor: Colors.teal
      ),
    );
  }
}
