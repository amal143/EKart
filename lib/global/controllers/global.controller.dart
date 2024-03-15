import 'package:flutter/foundation.dart';

class GlobalController with ChangeNotifier {
  //*---------------------------------------------------- Api Loading
  bool _apiLoading = false;
  bool get apiLoading => _apiLoading;
  void changeApiLoading(bool loading) {
    _apiLoading = loading;
    notifyListeners();
  }
//*---------------------------------------------------- Api Loading
}
