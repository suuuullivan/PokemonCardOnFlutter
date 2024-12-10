import 'dart:math';

import 'package:flutter/material.dart';

class CardInformationViewModel extends ChangeNotifier {
  bool isLocked = false;
  double rotationX = 0;
  double rotationY = 0;
  final double maxRotation = pi / 8;

  void updateRotation(double deltaX, double deltaY) {
    if (!isLocked) {
      rotationY += deltaX * 0.01;
      rotationX -= deltaY * 0.01;

      rotationX = rotationX.clamp(-maxRotation, maxRotation);
      rotationY = rotationY.clamp(-maxRotation, maxRotation);

      notifyListeners();
    }
  }

  void toggleLock(bool value) {
    isLocked = value;
    if (isLocked) {
      rotationX = 0;
      rotationY = 0;
    }
    notifyListeners();
  }
}