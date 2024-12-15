import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'my_app.dart';

bool? isTheme;
int? counter;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  isTheme = sharedPreferences.getBool('isTheme') ?? true;
  counter = sharedPreferences.getInt('counter') ?? 0;
  runApp(
    const MyApp(),
  );
}
