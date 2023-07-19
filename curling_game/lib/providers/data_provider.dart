import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier{
  // total  points
  double _totalScore = 0; 

  double get totalScore => _totalScore;

  set totalScore(double value) {
    _totalScore = value;
    notifyListeners();
  }

  // average points
  double _average = 0; 

  double get avgScore => _average;

  set avgScore(double value) {
    _average = value;
    notifyListeners();
  }

  // attempt points
  double _att = 1; 

  double get att => _att;

  set att(double value) {
    _att = value;
    notifyListeners();
  }
}