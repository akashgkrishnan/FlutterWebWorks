// import 'dart:io';
List<int> _checkHasWon(var moves) {
  List<List<int>> _winningMoves = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ];

  for (var prop in _winningMoves) {
    bool didWin = true;
    for (var i in moves) {
      if (!prop.contains(i)) {
        didWin = false;
      }
    }
    if (didWin) {
      return prop.toList();
    }
  }
}

void main() {
  var moves = [3, 6, 12];
  var ans = _checkHasWon(moves);
  if (ans != null) {
    print(ans);
  }
}
