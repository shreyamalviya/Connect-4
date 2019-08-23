import 'package:flutter/material.dart';

// import 'package:connect4/logic.dart';
import 'package:connect4/view.dart';

void main() => runApp(MaterialApp(
      title: 'connect4',
      theme: ThemeData(primaryColor: Colors.yellow.shade700),
      home: MainPage(title: 'Connect 4'),
    ));

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final UIElements ui = UIElements();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: UIElements(),
    );
  }
}
