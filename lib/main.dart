import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'connect4',
      theme: ThemeData(
        primarySwatch: Colors.yellow),
      home: MyHomePage(title: 'Connect 4'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
        // main game board
        Align(
          alignment: Alignment(0.0, -0.7),
          child:
          Container(
            width: (MediaQuery.of(context).size.width)*(7/8),
            height: (MediaQuery.of(context).size.height)*(3/8),
            child: GridView.count(
              crossAxisCount: 7,
              children: List.generate(42, (_) {
                return Container(
                  color: Colors.yellow,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.yellow,
                        width: 2.5,
                        )
                      ),
                    ),
                  );
                }
              )
            ),
          )
        ),
      floatingActionButton: FloatingActionButton.extended(
        tooltip: 'How do I play?',
        icon: Icon(Icons.help_outline),
        foregroundColor: Colors.black87,
        label: Text('How do I play?'),
        onPressed: () {
          showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 2.0, 32.0, 32.0),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Text('How do I play?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        height: 3,
                        fontWeight: FontWeight.bold,
                       )
                    ),
                    Text('Be the first player to get 4 of your colored checkers in a row either horizontally, vertically or diagonally!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        height: 1.5,
                       )
                      ),
                    ]
                  )
                )
              );
            }
          );
        },
      ),
    );
  }
}