import 'package:flutter/material.dart';
import 'package:game_2/interface/choose.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/background.JPG'),
        fit: BoxFit.cover,
      )),
      padding: EdgeInsets.only(top: 350),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Choose()));
          },
          child: Text(
            'Start',
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 50.0,
                color: Colors.white,
                fontWeight: FontWeight.w300),
          ),
          style: ElevatedButton.styleFrom(primary: Colors.pink[100]),
        ),
      ),
    ));
  }
}
