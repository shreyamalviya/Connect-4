import 'package:flutter/material.dart';
// import 'package:connect4/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'connect4',
      theme: ThemeData(
        primaryColor: Colors.yellow.shade700),
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
      body: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        // grid: main game board
          Container(
            width: (MediaQuery.of(context).size.width)*(7/8),
            height: (MediaQuery.of(context).size.height)*(3/8),
            child: GridView.count(
              crossAxisCount: 7,
              children: List.generate(42, (_) {
                return Container(
                  color: Colors.yellow.shade700,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.yellow.shade700,
                        width: 2.5,
                        )
                      ),
                    ),
                  );
                }
              )
            ),
          ),
        // button: to play (7)
          getplaybuttons(),
        // box: cleaner ui
          SizedBox(height: 100),
        // button: how to play
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 28.0, 0.0),
              child: FloatingActionButton.extended(
                label: Text('How do I play?'),
                tooltip: 'How do I play?',
                icon: Icon(Icons.help_outline),
                backgroundColor: Colors.yellow.shade700,
                foregroundColor: Colors.black87,
                onPressed: howtoplay,
                )
              )
            )
          ]
        )
      )
    );
  }

  getplaybuttons() {
    List<Widget> buttons = List<Widget>();
    var numCols = 7;
    for (var i = 0; i < numCols; i++) {
      buttons.add(
        SizedBox(
          width: 51.0,
          child: FloatingActionButton(
            elevation: 0.0,
            child: Icon(Icons.arrow_drop_up,
              size: 90.0,
              color: Colors.yellow.shade700),
            tooltip: 'Column $i',
            backgroundColor: Colors.transparent,
            onPressed: null,
          )
        )
      );
    }
    return Padding(
      padding: EdgeInsets.only(left: 5),
      child: Row(children: buttons)
    );
  }

  howtoplay() {
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
  }
}