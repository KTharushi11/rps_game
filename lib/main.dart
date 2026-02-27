import 'dart:math';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';


void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const RockPaperScissors(),
    );
  }
}

class RockPaperScissors extends StatefulWidget {
  const RockPaperScissors({super.key});

  @override
  State<RockPaperScissors> createState() => _RockPaperScissorsState();
}

class _RockPaperScissorsState extends State<RockPaperScissors> {

  final List<String> choices = ["Rock", "Paper", "Scissors"];

  String userChoice = "";
  String computerChoice = "";
  String result = "Make your move!";

  int userScore = 0;
  int computerScore = 0;

  void playGame(String choice) {
    final random = Random();
    String compChoice = choices[random.nextInt(choices.length)];

    setState(() {
      userChoice = choice;
      computerChoice = compChoice;

      if (userChoice == computerChoice) {
        result = "It's a Draw!";
      } 
      else if (
          (userChoice == "Rock" && computerChoice == "Scissors") ||
          (userChoice == "Paper" && computerChoice == "Rock") ||
          (userChoice == "Scissors" && computerChoice == "Paper")) {
        result = "You Win!";
        userScore++;
      } 
      else {
        result = "Computer Wins!";
        computerScore++;
      }
    });
  }

  void resetGame() {
    setState(() {
      userScore = 0;
      computerScore = 0;
      userChoice = "";
      computerChoice = "";
      result = "Make your move!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Rock Paper Scissors"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              
              const Text(
                "🏆 Score",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text("🙂 You: $userScore",
                  style: const TextStyle(fontSize: 16)),
              Text("🤖 Computer: $computerScore",
                  style: const TextStyle(fontSize: 16)),

              const SizedBox(height: 40),

              
              Text("🙂 Your Choice: $userChoice"),
              Text("🤖 Computer Choice: $computerChoice"),

              const SizedBox(height: 30),

              
              Text(
                result == "You Win!"
                    ? "🎉 You Win!"
                    : result == "Computer Wins!"
                        ? "❌ Computer Wins!"
                        : result == "It's a Draw!"
                            ? "🤝 It's a Draw!"
                            : "🎮 Make your move!",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 106, 245, 203),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () => playGame("Rock"),
                    child: const Text("✊ Rock"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () => playGame("Paper"),
                    child: const Text("✋ Paper"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () => playGame("Scissors"),
                    child: const Text("✌️ Scissors"),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                ),
                onPressed: resetGame,
                child: const Text("🔄 Reset Game"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}