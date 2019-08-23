import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

// import 'package:connect4/logic.dart';

class UIElements extends StatefulWidget {
  _UIElementsState createState() => _UIElementsState();
}

class _UIElementsState extends State<UIElements> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          getGameBoard(),
          // getPlayButtons(),
          getBlankSpace(50),
          getRestartButton(),
          getBlankSpace(50),
          getHowToPlayButton(),
        ],
      ),
    );
  }

  final mainColor = Colors.yellow.shade700;
  int colsCount = 7;
  int rowsCount = 6;
  var playedMoves = {"red": [], "blue": []};
  var playerTurn = "red";

  getGameBoard() {
    return Container(
      width: MediaQuery.of(context).size.width * (7 / 8),
      height: MediaQuery.of(context).size.height * (3 / 8),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: colsCount,
        children: List.generate(
          rowsCount * colsCount,
          (index) {
            return InkWell(
              onTap: null,
              child: Container(
                color: mainColor,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: mainColor,
                      width: 2.5,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // getPlayButtons() {
  //   List<Widget> buttons = List<Widget>();
  //   var numCols = 7;
  //   for (var i = 0; i < numCols; i++) {
  //     buttons.add(
  //       Container(
  //         child: FloatingActionButton(
  //           elevation: 0.0,
  //           child: Icon(Icons.arrow_drop_up, color: mainColor),
  //           tooltip: 'Column ${i + 1}',
  //           backgroundColor: Colors.transparent,
  //           onPressed: null,
  //         ),
  //       ),
  //     );
  //   }
  //   return Row(
  //       children: buttons, mainAxisAlignment: MainAxisAlignment.spaceEvenly);
  // }

  getRestartButton() {
    return FloatingActionButton(
      child: Icon(Icons.replay, size: 30.0),
      backgroundColor: mainColor,
      foregroundColor: Colors.black87,
      onPressed: () {},
    );
  }

  getBlankSpace(double space) {
    return SizedBox(height: space);
  }

  getHowToPlayButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 28.0, 0.0),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: FloatingActionButton.extended(
              hoverColor: Colors.blue,
              label: AutoSizeText(
                'How do I play?',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              icon: Icon(Icons.help_outline, size: 30.0),
              backgroundColor: mainColor,
              foregroundColor: Colors.black87,
              onPressed: getHowToPlay,
            ),
          ),
        ),
      ),
    );
  }

  getHowToPlay() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 2.0, 32.0, 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AutoSizeText(
                  'How do I play?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    height: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AutoSizeText(
                  'Be the first player to get 4 of your colored checkers in a row either horizontally, vertically or diagonally!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    inherit: true,
                    color: Colors.black,
                    fontSize: 20.0,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
