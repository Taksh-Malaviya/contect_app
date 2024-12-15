import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/theme_model.dart';

class ThemeController extends ChangeNotifier {
  ThemeModel themeModel;

  ThemeController({
    required this.themeModel,
  });

  void changeThemeValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    themeModel.isTheme = !themeModel.isTheme;

    await sharedPreferences.setBool('isTheme', themeModel.isTheme);

    notifyListeners();
  }
}
