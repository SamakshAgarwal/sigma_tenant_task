import 'package:flutter/cupertino.dart';

class Expense {
  bool isSelected = true;
  final String num;
  final String date = '02/06/2017';
  final String amount;

  Expense(
      { @required this.num, @required this.amount});

  invertIsSelected() {
    isSelected = !isSelected;
  }
}
