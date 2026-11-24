# 🔐 The Lost Vault

## 📌 About the Project

**The Lost Vault** is a C++ console-based puzzle game developed using Object-Oriented Programming (OOP) concepts.

The player enters a mysterious vault and must solve three different puzzles to unlock it and discover its secret ending.

At the beginning of the game, the player enters their own name before starting the adventure.

## 🎮 How to Play

1. Run the program.
2. Enter your name when requested.
3. Read the first puzzle displayed on the screen.
4. Type your answer and press Enter.
5. If you need help, type `H` to display a hint.
6. Solve all three puzzles to unlock the vault.

### Game Rules

- Each puzzle has two attempts.
- Each correct answer gives the player 10 points.
- Using a hint deducts 5 points.
- Each solved puzzle gives the player one secret fragment.
- A hint can only be used once per puzzle.
- The player must collect all three fragments to win.
- If the player uses all attempts without solving a puzzle, the game ends.

## 🧩 Puzzle Levels

### 1. Number Lock
Double a number and add 6. The result is 20.

What is the original number?

### 2. Code Lock
Use the following letter values:

- A = 1
- B = 2
- C = 3

Decode the word CAB into numbers.

### 3. Final Lock
Find the missing number:

`3 - 6 - 12 - 24 - ?`

## 💡 Game Features

- Interactive console-based gameplay.
- Player name input.
- Three progressive puzzle levels.
- Hint system.
- Score tracking.
- Attempt management.
- Secret fragment collection.
- Special winning ending.

## 💻 Technologies Used

- Programming Language: C++
- Object-Oriented Programming (OOP)
- Console Application

## 🏗️ OOP Concepts Applied

1. **Classes and Objects:** Organizing the program into separate classes.
2. **Encapsulation:** Protecting player data using private members and public methods.
3. **Constructors:** Initializing objects when they are created.
4. **Destructors:** Executing functions when objects are destroyed.
5. **Inheritance:** Creating specialized puzzle classes from a base Puzzle class.
6. **Polymorphism:** Using virtual functions and function overriding.
7. **Function Overloading:** Defining multiple functions with the same name but different parameters.
8. **Access Modifiers:** Using private, public, and protected.

## ▶️ How to Compile and Run

Compile the program using a C++ compiler:

```bash
g++ main.cpp -o LostVault
```

Run on Linux or macOS:

```bash
./LostVault
```

Run on Windows:

```bash
LostVault.exe
```

## 🏆 Winning the Game

The player wins by solving all three puzzles and collecting all three secret fragments.

After unlocking the vault, the player discovers the secret message:

"The greatest treasure is not gold... It is the knowledge you used to open this vault."

## 📚 Course

Object-Oriented Programming (OOP)

## 🎓 Department

Artificial Intelligence

University of Fallujah
