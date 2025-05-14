Tic-Tac-Toe Game in Dart

A simple terminal-based Tic-Tac-Toe game implemented in Dart. Two players take turns playing on the same device by entering numbers (1–9) that correspond to positions on a 3x3 board.

📋 Features
Two-player game (X and O).

Validates user input.

Checks for a win or a draw.

Option to play multiple rounds.

Clean terminal interface.

Fully commented in both English and Arabic.

🧑‍💻 Requirements
Dart SDK installed
➤ Download Dart

▶️ How to Run
Save the code into a Dart file, for example:
tic_tac_toe.dart

Open a terminal in the same directory.

Run the program:

bash
Copy
Edit
dart tic_tac_toe.dart
🎯 How to Play
The board positions are numbered from 1 to 9:

markdown
Copy
Edit
1 | 2 | 3
---------
4 | 5 | 6
---------
7 | 8 | 9
Players take turns entering the number of the cell they want to mark (X or O).

The game ends when:

A player wins by aligning three marks horizontally, vertically, or diagonally.

All cells are filled (draw).

After a round, you'll be asked if you want to play again.

🛠 Code Structure
printBoard() – Renders the current state of the board.

checkWin(player) – Checks if the specified player has won.

isBoardFull() – Detects a draw (full board).

getPlayerMove(player) – Gets and validates user input.

playAgain() – Prompts user to play another round.

playGame() – Runs the main game loop.

main() – Entry point, initializes the game.

🗨 Languages Used
Dart

Comments in English and Arabic for clarity and bilingual support.

📸 Preview
markdown
Copy
Edit
Welcome to Tic-Tac-Toe!
Player X goes first, followed by Player O.
Enter a number (1-9) corresponding to the position on the board.

=== TIC-TAC-TOE ===
1 | 2 | 3
---------
4 | 5 | 6
---------
7 | 8 | 9

Player X, enter a number (1-9) for your move:
💡 Ideas for Future Enhancements
Add single-player mode with basic AI.

GUI version using Flutter.

Timer per turn or score tracking.

