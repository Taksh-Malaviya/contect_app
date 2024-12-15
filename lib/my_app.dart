import 'package:contect_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'controllers/contact_contorller.dart';
import 'controllers/counter_controller.dart';
import 'controllers/stepper_controller.dart';
import 'controllers/theme_contorller.dart';
import 'main.dart';
import 'models/counter_model.dart';
import 'models/theme_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      designSize: Size(width, height),
      minTextAdapt: true,
      builder: (context, _) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CounterController(
              counterModel: CounterModel(counter: counter ?? 0),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeController(
              themeModel: ThemeModel(
                isTheme: isTheme ?? true,
              ),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => StepperController(),
          ),
          ChangeNotifierProvider(
            create: (context) => ContactsController(),
          ),
        ],
        builder: (context, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: AppThemes.lightTheme,
          // darkTheme: AppThemes.darkTheme,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: (Provider.of<ThemeController>(context, listen: true)
                  .themeModel
                  .isTheme)
              ? ThemeMode.light
              : ThemeMode.dark,
          routes: Routes.myRoutes,
        ),
      ),
    );
  }
}
