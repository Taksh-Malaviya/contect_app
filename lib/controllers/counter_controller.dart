import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/counter_model.dart';

class CounterController extends ChangeNotifier {
  CounterModel counterModel;

  CounterController({
    required this.counterModel,
  });

  void increment() async {
    counterModel.counter++;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setInt('counter', counterModel.counter);

    notifyListeners();
  }

  void decrement() async {
    if (counterModel.counter > 0) {
      counterModel.counter--;
    }

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setInt('counter', counterModel.counter);
    notifyListeners();
  }
}
