import 'package:flutter/material.dart';

playMove(mainGame, boardSlot) {
  int col = boardSlot % mainGame.colsCount;

  final playerIndex = mainGame.players.indexOf(mainGame.playerTurn);
  final player = mainGame.playerTurn;
  final opponent = mainGame.players[(playerIndex + 1) % 2];

  int i;
  for (i = 5; i != -1; --i)
    if (!mainGame.playedMoves[player].contains(col + (7 * i)) &&
        !mainGame.playedMoves[opponent].contains(col + (7 * i))) break;

  if (i != -1) {
    mainGame.playedMoves[mainGame.playerTurn].add(col + (7 * i));
    mainGame.playerTurn = opponent;
    // checkGameEnd(mainGame);
  }
}

// checkGameEnd(mainGame) {

// }