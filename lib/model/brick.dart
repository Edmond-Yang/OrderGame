class NumBrick {
  int num;
  double _opacity = 1;
  bool isCorrect = false;

  NumBrick({required this.num});

  int getNum() => num;
  bool getIsCorrect() => isCorrect;
  double getOpacity() => _opacity;

  void setIsCorrect() => isCorrect = true;
  void setOpacity(double _num) => _opacity = _num;
}
