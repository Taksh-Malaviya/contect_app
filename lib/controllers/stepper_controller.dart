import 'package:flutter/material.dart';

import '../models/stepper_model.dart';

class StepperController extends ChangeNotifier {
  StepperModel stepperModel = StepperModel(
    stepperIndex: 0,
  );

  void stepContinue() {
    if (stepperModel.stepperIndex < 3) {
      stepperModel.stepperIndex++;
    }

    notifyListeners();
  }

  void stepCancel() {
    if (stepperModel.stepperIndex > 0) {
      stepperModel.stepperIndex--;
    }
    notifyListeners();
  }
}
