import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'package:connect4/view.dart';

void main() => runApp(
      MaterialApp(
        title: 'connect4',
        theme: ThemeData(primaryColor: Colors.blue),
        home: MainPage(title: 'Connect 4'),
      ),
    );

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: WaveWidget(
              config: CustomConfig(
                colors: [
                  Colors.blue.shade100,
                  Colors.blue.shade200,
                ],
                heightPercentages: [0.2, 0.4],
                durations: [
                  20000,
                  14000,
                ],
              ),
              size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.width),
            ),
          ),
          UIElements(),
        ],
      ),
    );
  }
}
