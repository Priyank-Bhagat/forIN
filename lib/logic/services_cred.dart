import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stringProvider =
    ChangeNotifierProvider<ChangeString>((ref) => ChangeString());

class ChangeString extends ChangeNotifier {
  List<String> lString = ['initial value', 'second string'];

  void addString(String value) {
    lString.add(value);
    notifyListeners();
  }

  void removeString(int index) {
    lString.removeAt(index);
    notifyListeners();
  }
}
