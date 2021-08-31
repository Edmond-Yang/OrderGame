import 'package:flutter/material.dart';
import 'package:game_2/interface/game.dart';

class Difficulty extends StatefulWidget {
  const Difficulty({Key? key}) : super(key: key);

  @override
  _DifficultyState createState() => _DifficultyState();
}

class _DifficultyState extends State<Difficulty> {
  int num = 0;
  List<String> mode = ['Easy', 'Medium', 'Difficulty'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    num = num == 0 ? 2 : num - 1;
                  });
                },
                icon: Icon(Icons.arrow_left),
                iconSize: 40.0,
              ),
              Text(
                mode[num],
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 50.0,
                    fontWeight: FontWeight.w300),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    num = num == 2 ? 0 : num + 1;
                  });
                },
                icon: Icon(Icons.arrow_right),
                iconSize: 40.0,
              ),
            ],
          ),
          SizedBox(
            height: 250.0,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Game(
                            num: num + 3,
                          )));
            },
            child: Text(
              'Start',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Nunito',
                  fontSize: 35.0,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
