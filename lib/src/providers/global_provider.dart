import 'package:flutter/cupertino.dart';

class GlobalNotifier extends ChangeNotifier {
  bool showNotification = false;

  void showNotificationDrawer(bool status) {
    showNotification = status;
    notifyListeners();
  }
}
