// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class game extends StatefulWidget {
  const game({super.key});

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  bool showButton = false;
  bool Xtrun = true;
  List<String> boxes = ["", "", "", "", "", "", "", "", ""];
  String winner = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFff6767),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 150), // Add top padding here
                child: Text(
                  winner.isEmpty
                      ? Xtrun
                          ? "X turn"
                          : "O turn"
                      : "Good luck next time",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return btnG((boxes[index]), () {
                      if (winner.isEmpty) {
                        setState(() {
                          if (Xtrun && boxes[index] == "") {
                            boxes[index] = "X";
                            Xtrun = !Xtrun;
                          } else if (Xtrun == false && boxes[index] == "") {
                            boxes[index] = "O";
                            Xtrun = !Xtrun;
                          }
                          checkWinner();
                        });
                      }
                    });
                  }),
            ),
            Text(
              winner,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 50,
                child: showButton
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          setState(() {
                            boxes = ["", "", "", "", "", "", "", "", ""];
                            winner = "";
                            showButton = !showButton;
                          });
                        },
                        child: Text(
                          "Play Again !",
                          style: TextStyle(fontSize: 20),
                        ))
                    : Container())
          ],
        ),
      ),
    );
  }

  void checkWinner() {
    if (boxes[0] == boxes[1] && boxes[0] == boxes[2] && boxes[0] != "") {
      setState(() {
        winner = "Player ${boxes[0]} won";
        showButton = true;
      });
    } else if (boxes[0] == boxes[3] && boxes[0] == boxes[6] && boxes[0] != "") {
      setState(() {
        winner = "Player ${boxes[0]} won";
        showButton = true;
      });
    } else if (boxes[0] == boxes[4] && boxes[0] == boxes[8] && boxes[0] != "") {
      setState(() {
        winner = "Player ${boxes[0]} won";
        showButton = true;
      });
    } else if (boxes[1] == boxes[4] && boxes[1] == boxes[7] && boxes[1] != "") {
      setState(() {
        winner = "Player ${boxes[1]} won";
        showButton = true;
      });
    } else if (boxes[2] == boxes[5] && boxes[2] == boxes[8] && boxes[2] != "") {
      setState(() {
        winner = "Player ${boxes[2]} won";
        showButton = true;
      });
    } else if (boxes[3] == boxes[4] && boxes[3] == boxes[5] && boxes[3] != "") {
      setState(() {
        winner = "Player ${boxes[3]} won";
        showButton = true;
      });
    } else if (boxes[6] == boxes[7] && boxes[6] == boxes[8] && boxes[6] != "") {
      setState(() {
        winner = "Player ${boxes[6]} won";
        showButton = true;
      });
    } else if (boxes[2] == boxes[4] && boxes[2] == boxes[6] && boxes[2] != "") {
      setState(() {
        winner = "Player ${boxes[2]} won";
        showButton = true;
      });
    } else if (!boxes.contains("")) {
      setState(() {
        winner = "its a draw";
        showButton = true;
      });
    }
  }
}

class btnG extends StatelessWidget {
  late final String txt;
  late final Function tap;
  btnG(this.txt, this.tap);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Text(
        txt,
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: txt == "O" ? Colors.white : Colors.black),
      ),
      onPressed: () => tap(),
    );
  }
}