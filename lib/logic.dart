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
    var currentSlot = col + (7 * i);
    mainGame.playedMoves[mainGame.playerTurn].add(currentSlot);
    checkGameEnd(mainGame, currentSlot);
    mainGame.playerTurn = opponent;
  }
}

checkGameEnd(mainGame, currentSlot) {
  int row = currentSlot ~/ mainGame.colsCount;

  checkHorizontal(mainGame, mainGame.playedMoves[mainGame.playerTurn], row);
  checkVertical(
      mainGame, mainGame.playedMoves[mainGame.playerTurn], currentSlot, row);
  checkDiagonalUp(
      mainGame, mainGame.playedMoves[mainGame.playerTurn], currentSlot);
  checkDiagonalDown(
      mainGame, mainGame.playedMoves[mainGame.playerTurn], currentSlot);
}

checkHorizontal(mainGame, played, row) {
  int rowSlot = (7 * row) - 1;
  List rowSlotRange = List<int>.generate(
    7,
    (_) {
      rowSlot = rowSlot + 1;
      return (rowSlot);
    },
  );
  List playedInRow = List();
  int numTrue = 0;
  for (int checkSlotIndex = 0;
      checkSlotIndex != rowSlotRange.length;
      ++checkSlotIndex) {
    if (played.contains(rowSlotRange[checkSlotIndex])) {
      playedInRow.add(true);
      ++numTrue;
    } else {
      playedInRow.add(false);
      numTrue = 0;
    }
    if (numTrue == 4) mainGame.showEndGamePopUp();
  }
}

checkVertical(mainGame, played, currentSlot, row) {
  if (row <= 2) {
    for (int checkSlot = currentSlot + 7;
        checkSlot <= currentSlot + 21;
        checkSlot = checkSlot + 7) {
      if (!played.contains(checkSlot)) return;
    }
    mainGame.showEndGamePopUp();
  }
}

checkDiagonalUp(mainGame, played, currentSlot) {
  List diagonalUpSlotRange = List();

  int slot;
  slot = currentSlot - 6;
  while (slot > 0) {
    if (slot % 7 == 0) break;
    diagonalUpSlotRange.add(slot);
    slot -= 6;
    if (slot % 7 == 0 && !(slot < 0)) {
      diagonalUpSlotRange.add(slot);
      break;
    }
  }
  slot = currentSlot;
  while (slot < 42) {
    diagonalUpSlotRange.add(slot);
    slot += 6;
    if (slot % 7 == 6) break;
  }
  diagonalUpSlotRange.sort();

  List playedInDiagonalUp = List();
  int numTrue = 0;
  for (int checkSlotIndex = 0;
      checkSlotIndex != diagonalUpSlotRange.length;
      ++checkSlotIndex) {
    if (played.contains(diagonalUpSlotRange[checkSlotIndex])) {
      playedInDiagonalUp.add(true);
      ++numTrue;
    } else {
      playedInDiagonalUp.add(false);
      numTrue = 0;
    }
    if (numTrue == 4) mainGame.showEndGamePopUp();
  }
}

checkDiagonalDown(mainGame, played, currentSlot) {
  List diagonalDownSlotRange = List();
  int slot;
  slot = currentSlot - 8;
  while (slot > 0) {
    if (slot % 7 == 6) break;
    diagonalDownSlotRange.add(slot);
    slot -= 8;
    if (slot % 7 == 0 && !(slot < 0)) {
      diagonalDownSlotRange.add(slot);
      break;
    }
  }
  slot = currentSlot;
  while (slot < 42) {
    diagonalDownSlotRange.add(slot);
    slot += 8;
    if (slot % 7 == 0) break;
  }
  diagonalDownSlotRange.sort();

  List playedInDiagonalDown = List();
  int numTrue = 0;
  for (int checkSlotIndex = 0;
      checkSlotIndex != diagonalDownSlotRange.length;
      ++checkSlotIndex) {
    if (played.contains(diagonalDownSlotRange[checkSlotIndex])) {
      playedInDiagonalDown.add(true);
      ++numTrue;
    } else {
      playedInDiagonalDown.add(false);
      numTrue = 0;
    }
    if (numTrue == 4) mainGame.showEndGamePopUp();
  }
}
