import 'package:flutter/material.dart';
import 'package:game_2/service/difficulty.dart';

class Choose extends StatelessWidget {
  const Choose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Container(
        padding: EdgeInsets.only(top: 100),
        child: Center(
          child: Column(
            children: [
              Text(
                'CHOOSE DIFFICULTY',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 150.0),
              Difficulty()
            ],
          ),
        ),
      ),
    );
  }
}
