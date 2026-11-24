#include <iostream>
#include <string>
using namespace std;

// ================= PLAYER CLASS =================

class Player
{
private:
    string name;
    int score;
    int attempts;
    int fragments;

public:
    Player(string n)
        : name(n), score(0), attempts(2), fragments(0)
    {
        cout << "\nPlayer created successfully!" << endl;
    }

    ~Player()
    {
        cout << "\nPlayer object destroyed." << endl;
    }

    string getName() const
    {
        return name;
    }

    int getScore() const
    {
        return score;
    }

    int getAttempts() const
    {
        return attempts;
    }

    int getFragments() const
    {
        return fragments;
    }

    void reduceAttempt()
    {
        if (attempts > 0)
            attempts--;
    }

    void resetAttempts()
    {
        attempts = 2;
    }

    void addFragment()
    {
        fragments++;
    }

    // Function Overloading - First Version
    void addPoints(int points)
    {
        score += points;
    }

    // Function Overloading - Second Version
    void addPoints(int points, string message)
    {
        score += points;
        cout << message << endl;
    }

    void deductPoints(int points)
    {
        score -= points;

        if (score < 0)
            score = 0;
    }
};


// ================= ABSTRACT PUZZLE CLASS =================

class Puzzle
{
protected:
    string title;
    string question;
    string answer;
    string hint;

public:
    Puzzle(string t, string q, string a, string h)
        : title(t), question(q), answer(a), hint(h)
    {
    }

    virtual void displayQuestion()
    {
        cout << "\n========== " << title << " ==========" << endl;
        cout << question << endl;
    }

    void showHint()
    {
        cout << "\nHint: " << hint << endl;
    }

    string getTitle() const
    {
        return title;
    }

    // Pure Virtual Function
    virtual bool checkAnswer(string userAnswer) = 0;

    // Virtual Destructor
    virtual ~Puzzle()
    {
    }
};


// ================= MATH PUZZLE =================

class MathPuzzle : public Puzzle
{
public:
    MathPuzzle()
        : Puzzle(
            "Number Lock",
            "Double a number and add 6.\nThe result is 20.\nWhat is the number?",
            "7",
            "Think about reversing the operations."
        )
    {
    }

    bool checkAnswer(string userAnswer) override
    {
        return userAnswer == answer;
    }
};


// ================= CODE PUZZLE =================

class CodePuzzle : public Puzzle
{
public:
    CodePuzzle()
        : Puzzle(
            "Code Lock",
            "A = 1, B = 2, C = 3.\nDecode the word CAB into numbers.",
            "312",
            "Replace every letter with its number."
        )
    {
    }

    bool checkAnswer(string userAnswer) override
    {
        return userAnswer == answer;
    }
};


// ================= SEQUENCE PUZZLE =================

class SequencePuzzle : public Puzzle
{
public:
    SequencePuzzle()
        : Puzzle(
            "Final Lock",
            "Find the missing number:\n3 - 6 - 12 - 24 - ?",
            "48",
            "Look at how each number changes."
        )
    {
    }

    bool checkAnswer(string userAnswer) override
    {
        return userAnswer == answer;
    }
};


// ================= GAME CLASS =================

class Game
{
private:
    Player player;
    Puzzle* puzzles[3];
    int puzzleCount;

    void playPuzzle(int index)
    {
        Puzzle* currentPuzzle = puzzles[index];

        player.resetAttempts();

        bool hintUsed = false;
        bool solved = false;

        currentPuzzle->displayQuestion();

        while (player.getAttempts() > 0 && !solved)
        {
            cout << "\nAttempts left: "
                 << player.getAttempts() << endl;

            cout << "Enter your answer or H for a hint: ";

            string userAnswer;
            cin >> userAnswer;

            if (userAnswer == "H" || userAnswer == "h")
            {
                if (!hintUsed)
                {
                    currentPuzzle->showHint();

                    player.deductPoints(5);

                    hintUsed = true;

                    cout << "5 points deducted for the hint."
                         << endl;
                }
                else
                {
                    cout << "You have already used the hint!"
                         << endl;
                }

                continue;
            }

            // Polymorphism
            if (currentPuzzle->checkAnswer(userAnswer))
            {
                solved = true;

                if (hintUsed)
                {
                    player.addPoints(
                        10,
                        "Correct answer! You earned 10 points."
                    );
                }
                else
                {
                    player.addPoints(10);

                    cout << "Correct answer! +10 points."
                         << endl;
                }

                player.addFragment();

                cout << "Secret fragment collected!"
                     << endl;
            }
            else
            {
                player.reduceAttempt();

                cout << "Wrong answer! Try again."
                     << endl;
            }
        }

        if (!solved)
        {
            cout << "\nGAME OVER!" << endl;
        }
    }

public:
    Game(string playerName,
         Puzzle* p1,
         Puzzle* p2,
         Puzzle* p3)
        : player(playerName), puzzleCount(3)
    {
        puzzles[0] = p1;
        puzzles[1] = p2;
        puzzles[2] = p3;
    }

    void start()
    {
        cout << "\n================================" << endl;
        cout << "       THE LOST VAULT" << endl;
        cout << "================================" << endl;

        cout << "Welcome, " << player.getName() << "!"
             << endl;

        cout << "Solve three puzzles to open the vault."
             << endl;

        for (int i = 0; i < puzzleCount; i++)
        {
            playPuzzle(i);

            if (player.getAttempts() == 0)
            {
                cout << "\nYou failed to unlock the vault."
                     << endl;
                break;
            }

            cout << "\nCurrent Score: "
                 << player.getScore() << endl;

            cout << "Collected Fragments: "
                 << player.getFragments() << "/3"
                 << endl;
        }

        if (player.getFragments() == 3)
        {
            cout << "\n================================"
                 << endl;

            cout << "       VAULT UNLOCKED!"
                 << endl;

            cout << "================================"
                 << endl;

            cout << "You found the secret ending!"
                 << endl;

            cout << "The greatest treasure is not gold..."
                 << endl;

            cout << "It is the knowledge you used to open this vault."
                 << endl;
        }

        cout << "\nPlayer: " << player.getName() << endl;

        cout << "Final Score: " << player.getScore() << endl;

        cout << "Fragments: " << player.getFragments() << "/3"
             << endl;

        cout << "\nThank you for playing The Lost Vault!"
             << endl;
    }
};


// ================= MAIN FUNCTION =================

int main()
{
    string playerName;

    cout << "================================" << endl;
    cout << "       THE LOST VAULT" << endl;
    cout << "================================" << endl;

    cout << "\nEnter your name: ";
    getline(cin, playerName);

    MathPuzzle math;
    CodePuzzle code;
    SequencePuzzle sequence;

    Game game(playerName, &math, &code, &sequence);

    game.start();

    return 0;
}

