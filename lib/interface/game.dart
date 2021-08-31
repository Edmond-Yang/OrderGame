import 'package:flutter/material.dart';
import 'package:game_2/service/brickList.dart';

class Game extends StatelessWidget {
  final int num;
  Game({Key? key, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Container(
          padding: EdgeInsets.only(top: 70.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Uesd Time',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 20.0,
                  ),
                ),
                BrickList(cnt: num)
              ],
            ),
          )),
    );
  }
}
