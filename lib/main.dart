import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondPage()));
                },
                shape: const CircleBorder(),
                color: Colors.white,
                height: 150,
                minWidth: 150,
                child: const Text("Start"),
              ),
            ),
          ),
          Container(
            color: Colors.redAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondPage()));
                },
                shape: const CircleBorder(),
                color: Colors.white,
                height: 150,
                minWidth: 150,
                child: const Text("Start"),
              ),
            ),
          ),
        ],
      ),
      // MaterialButton(
      //   onPressed: (){
      //     Navigator.push(context, MaterialPageRoute(builder:] ((context) => const SecondPage())));
      //   },
      //   color: Colors.blueAccent,
      //   child: const Text("Go To SecondPage"),
      // ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  double blueCardHeight = 0;
  double redCardHeight = 0;
  bool initialValue = false;
  int playerAscore = 0;
  int playerBscore = 0;
  @override
  Widget build(BuildContext context) {
    // print(initialValue);
    if (initialValue == false) {
      blueCardHeight = MediaQuery.of(context).size.height / 2;
      redCardHeight = MediaQuery.of(context).size.height / 2;
      initialValue = true;
      
    }
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                blueCardHeight = blueCardHeight + 30;
                redCardHeight = redCardHeight - 30;
                playerBscore = playerBscore + 5;
                double screenHeight = MediaQuery.of(context).size.height;
                double maxHeight = screenHeight - 60;
                if (blueCardHeight > maxHeight) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              ResultPage(playerBscore,'b'))));
                }
              });
            },
            child: Container(
              color: Colors.blueAccent,
              height: blueCardHeight,
              width: double.infinity,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Player B",
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      playerBscore.toString(),
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          
          MaterialButton(
            onPressed: () {
              setState(() {
                redCardHeight = redCardHeight + 30;
                blueCardHeight = blueCardHeight - 30;
                playerAscore = playerAscore + 5;
                double screenHeight = MediaQuery.of(context).size.height;
                double maxHeight = screenHeight - 60;
                if (redCardHeight > maxHeight) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              ResultPage(playerAscore, 'a'))));
                }
              });
            },
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.redAccent,
              height: redCardHeight,
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(10),
              child: Row(
                  children: [
                     const Expanded(
                       child: Text(
                        "Player A",
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                         ),
                     ),
                    Text(
                      playerAscore.toString(),
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  // ResultPage({super.key});
  int score = 0;
  String player = "";
  ResultPage(this.score, this.player, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "a" ? Colors.redAccent : Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              score.toString(),
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              player == "a" ? "Player A Won" : "Player B Won",
              style: const TextStyle(fontSize: 35),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              color: Colors.white,
              child: const Text("Restart Game"),
            ),
          ],
        ),
      ),
    );
  }
}
