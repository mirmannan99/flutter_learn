import 'package:flutter/foundation.dart';

class CounterState extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void counter() {
    _count++;
    notifyListeners();
  }
}

// getter in dart for private field?


// godown holds the data  - change notifier 
// shopkeeper provider - send provider data
// mohsin consume - consumer