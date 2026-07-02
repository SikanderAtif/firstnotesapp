import 'package:flutter/material.dart';

enum Priority {
  none, low, medium, high;

  Color get color {
    switch(this) {
      case none: return Colors.white;
      case low: return Colors.green;
      case medium: return Colors.yellow;
      case high: return Colors.red;
    }
  }

  String get label {
    switch(this) {
      case none: return 'None';
      case low: return 'Low';
      case medium: return 'Medium';
      case high: return 'High';
    }
  }
}