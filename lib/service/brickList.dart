import 'dart:async';
import 'package:flutter/material.dart';
import 'package:game_2/model/brick.dart';
import 'package:game_2/interface/game.dart';
import 'package:game_2/interface/choose.dart';

class BrickList extends StatefulWidget {
  final int cnt;
  BrickList({Key? key, required this.cnt}) : super(key: key);

  @override
  _BrickListState createState() => _BrickListState(cnt: cnt);
}

class _BrickListState extends State<BrickList> {
  int cnt;
  int count = 1;
  double _height = 0;
  double time = 0;
  bool isPressed = false;

  List<NumBrick> _numBrick = [];

  _BrickListState({required this.cnt});

  @override
  void initState() {
    super.initState();

    _height = cnt == 3
        ? 40.0
        : cnt == 4
            ? 30.0
            : 15.0;

    for (int i = 1; i <= cnt * cnt; i++) {
      _numBrick.add(NumBrick(num: i));
    }
    _numBrick.shuffle();

    for (NumBrick i in _numBrick)
      Future.delayed(
          Duration(seconds: 2),
          () => setState(() {
                i.setOpacity(0);
              }));

    Future.delayed(Duration(seconds: 2), () {
      Timer.periodic(Duration(milliseconds: 10), (timer) {
        if (count <= cnt * cnt)
          setState(() {
            time += 0.01;
          });
        else {
          timer.cancel();
        }
      });
    });
  }

  Widget showTime() {
    return Text(
      '${time.toStringAsFixed(2)} s',
      style: TextStyle(
          color: Colors.black,
          fontFamily: 'Nunito',
          fontSize: 40.0,
          fontWeight: FontWeight.w400),
    );
  }

  Widget createBrick(NumBrick self) {
    return TextButton(
        onPressed: () {
          if (!isPressed) setState(() => self.setOpacity(1));

          if (count == self.getNum() && !isPressed) {
            count++;
            self.setIsCorrect();
          } else if (!self.getIsCorrect() && !isPressed) {
            isPressed = true;
            Future.delayed(Duration(milliseconds: 1500), () {
              setState(() {
                self.setOpacity(0);
              });
              isPressed = false;
            });
          }
        },
        child: ClipRRect(
          child: Text('${self.getNum()}',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, self.getOpacity()),
                  fontFamily: 'Nunito',
                  fontSize: 40.0,
                  fontWeight: FontWeight.w400)),
        ),
        style: TextButton.styleFrom(
            primary: Colors.pink[200], backgroundColor: Colors.white));
  }

  @override
  Widget build(BuildContext context) {
    print(count);

    List<Widget> _column = [
      SizedBox(height: 30.0),
      showTime(),
      SizedBox(height: 30.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Game(num: cnt)));
            },
            icon: Icon(
              Icons.restart_alt,
              size: 20.0,
              color: Colors.black,
            ),
            label: Text(
              'Restart',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Nunito',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400),
            ),
            style: TextButton.styleFrom(primary: Colors.pink[200]),
          ),
          SizedBox(
            width: 20.0,
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Choose()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20.0,
              color: Colors.black,
            ),
            label: Text(
              'Choose Difficulty',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Nunito',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400),
            ),
            style: TextButton.styleFrom(primary: Colors.pink[200]),
          ),
        ],
      ),
      SizedBox(
        height: 40.0,
      )
    ];

    for (int i = 0; i < cnt; i++) {
      List<Widget> _row = [];
      for (int j = 0; j < cnt; j++) {
        _row.add(createBrick(_numBrick[cnt * i + j]));
      }
      _column.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _row,
      ));
      _column.add(SizedBox(height: _height));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _column,
    );
  }
}
