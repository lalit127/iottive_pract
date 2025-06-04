import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension SpacingExtension on double {
  /// Vertical Space
  Widget get toVSB {
    return SizedBox(height: this);
  }

  /// Horizontal Space
  Widget get toHSB {
    return SizedBox(width: this);
  }
}

extension ContextExtension on BuildContext {
  /// Get the height of the screen
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Get the width of the screen
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Get the text scale factor
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
}

bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

String formatDateTime(DateTime dateTime) {
  return DateFormat('dd-MMMM-yyyy').format(dateTime);
}
