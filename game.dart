import 'dart:io';

// تمثيل اللوحة (Board representation)
List<String> board = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

// دالة لطباعة اللوحة (Function to print the board)
void printBoard() {
  print('\n${board[0]} | ${board[1]} | ${board[2]}');
  print('---------');
  print('${board[3]} | ${board[4]} | ${board[5]}');
  print('---------');
  print('${board[6]} | ${board[7]} | ${board[8]}\n');
}

// دالة للتحقق إذا فاز اللاعب (Function to check if a player has won)
bool checkWin(String player) {
  // سطور للفوز (Winning positions)
  List<List<int>> winningPositions = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // سطور أفقية (horizontal rows)
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // سطور عمودية (vertical columns)
    [0, 4, 8], [2, 4, 6], // قطريان (diagonals)
  ];

  for (var position in winningPositions) {
    if (board[position[0]] == player &&
        board[position[1]] == player &&
        board[position[2]] == player) {
      return true;
    }
  }
  return false;
}

// دالة للتحقق إذا كانت اللعبة انتهت بالتعادل (Function to check if the game is a draw)
bool isBoardFull() {
  return !board.contains('1') &&
      !board.contains('2') &&
      !board.contains('3') &&
      !board.contains('4') &&
      !board.contains('5') &&
      !board.contains('6') &&
      !board.contains('7') &&
      !board.contains('8') &&
      !board.contains('9');
}

// دالة للتحقق من صحة الإدخال (Function to validate move input)
bool isValidMove(int move) {
  return move >= 1 &&
      move <= 9 &&
      board[move - 1] != 'X' &&
      board[move - 1] != 'O';
}

// دالة إعادة ضبط اللوحة (Function to reset the board)
void resetBoard() {
  board = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
}

// دالة للحصول على إدخال المستخدم مع التحقق من صحته (Function to get user input with validation)
int getPlayerMove(String player) {
  while (true) {
    print('Player $player, enter a number (1-9) for your move:');
    try {
      // Use a different approach for reading input
      String input = '';
      int? char = stdin.readByteSync();
      if (char != 10) {
        // Not a newline
        input = String.fromCharCode(char);
      }

      int? move = int.tryParse(input);
      if (move == null) {
        print('Invalid input. Please enter a number between 1 and 9.');
        continue;
      }

      if (!isValidMove(move)) {
        print(
          'Invalid move! Please enter a number between 1 and 9 that is not already taken.',
        );
        continue;
      }

      return move;
    } catch (e) {
      print('An error occurred: $e. Please try again.');
    }
  }
}

// دالة سؤال اللاعب إذا يريد اللعب مرة أخرى (Function to ask if player wants to play again)
bool playAgain() {
  while (true) {
    print('Do you want to play again? (y/n)');
    try {
      // Different approach for reading input
      int char = stdin.readByteSync();
      String response = String.fromCharCode(char).toLowerCase();

      if (response == 'y') {
        return true;
      } else if (response == 'n') {
        return false;
      } else {
        print('Invalid response. Please enter y or n.');
      }
    } catch (e) {
      print('An error occurred: $e. Please try again.');
    }
  }
}

// الدالة الرئيسية للعبة (Main game function)
void playGame() {
  String currentPlayer = 'X';
  bool gameRunning = true;

  while (gameRunning) {
    print('\n=== TIC-TAC-TOE ===');
    resetBoard();

    bool roundRunning = true;
    while (roundRunning) {
      printBoard();

      int move = getPlayerMove(currentPlayer);
      board[move - 1] = currentPlayer;

      if (checkWin(currentPlayer)) {
        printBoard();
        print('🎉 Player $currentPlayer wins! 🎉');
        roundRunning = false;
      } else if (isBoardFull()) {
        printBoard();
        print('😐 It\'s a draw! 😐');
        roundRunning = false;
      } else {
        // تبديل اللاعبين (Switch players)
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }
    }

    // سؤال اللاعبين إذا يريدون اللعب مرة أخرى (Ask players if they want to play again)
    gameRunning = playAgain();
  }

  print('Thanks for playing! Goodbye.');
}

void main() {
  print('Welcome to Tic-Tac-Toe!');
  print('Player X goes first, followed by Player O.');
  print('Enter a number (1-9) corresponding to the position on the board.');

  playGame();
}
