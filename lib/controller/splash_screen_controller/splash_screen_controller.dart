import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreenController extends ChangeNotifier {
  bool onLoading = false;

  void loadingFinished() {
    Timer(
      const Duration(seconds: 3),
      () {
        onLoading = true;
        notifyListeners();
      },
    );
    notifyListeners();
  }
}
