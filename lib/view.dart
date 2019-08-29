import 'package:flutter/material.dart';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:connect4/logic.dart';

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
          getBlankSpace(50),
          getRestartButton(),
          getBlankSpace(50),
          getHowToPlayButton(),
        ],
      ),
    );
  }

  final mainColor = Colors.yellow.shade700;
  final int colsCount = 7;
  final int rowsCount = 6;
  final players = List.unmodifiable(["red", "blue"]);
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
            var slotColor = Colors.white60;
            if (playedMoves["red"].contains(index))
              slotColor = Colors.redAccent.shade700;
            if (playedMoves["blue"].contains(index))
              slotColor = Colors.blueAccent.shade700;

            return InkWell(
              onTap: () => setState(
                () {
                  playMove(this, index);
                },
              ),
              child: Container(
                color: mainColor,
                child: Container(
                  decoration: BoxDecoration(
                    color: slotColor,
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

  getRestartButton() {
    return FloatingActionButton(
      child: Icon(Icons.replay, size: 30.0),
      backgroundColor: mainColor,
      foregroundColor: Colors.black87,
      onPressed: () => setState(
        () {
          playedMoves["red"].clear();
          playedMoves["blue"].clear();
        },
      ),
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

  showEndGamePopUp() {
    var winner = playerTurn;
    var winnerColor = winner == "blue"
        ? Colors.blueAccent.shade700
        : Colors.redAccent.shade700;
    var winMsg = "$winner wins!".toUpperCase();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Container(
          height: 500,
          width: 500,
          child: SimpleDialog(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(28.0),
            ),
            backgroundColor: Colors.grey.shade300,
            elevation: 4.0,
            title: Center(
              child: Text(
                winMsg,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: winnerColor,
                  fontSize: 40.0,
                  height: 1.5,
                ),
              ),
            ),
            children: <Widget>[
              Center(
                child: ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 125,
                      child: RaisedButton(
                        color: Colors.grey.shade200,
                        elevation: 3.0,
                        onPressed: () {
                          Navigator.pop(context);
                          setState(
                            () {
                              playedMoves["red"].clear();
                              playedMoves["blue"].clear();
                            },
                          );
                        },
                        child: Center(
                          child: Text(
                            "Play again",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18.0,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 125,
                      child: RaisedButton(
                        color: Colors.grey.shade200,
                        elevation: 3.0,
                        onPressed: () => exit(0),
                        child: Center(
                          child: Text(
                            "Exit",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18.0,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
