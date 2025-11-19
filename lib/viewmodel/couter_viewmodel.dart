import 'package:flutter/material.dart';
import 'package:flutter_project_1/model/counter_model.dart';

class CouterViewmodel with ChangeNotifier {
  Countermodel _countermodel = Countermodel(count: 0);

  int get counter => _countermodel.count;

  void increment() {
    _countermodel.count++;
    notifyListeners();
  }
}