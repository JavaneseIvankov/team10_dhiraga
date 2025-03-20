import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier {
  List<Map<String, String>> _savedNotifications = [];

  List<Map<String, String>> get savedNotifications => _savedNotifications;

  void addNotification(Map<String, String> event) {
    // Cek apakah event sudah tersimpan agar tidak duplikat
    bool exists = _savedNotifications.any((e) => e['title'] == event['title']);
    if (!exists) {
      _savedNotifications.add(event);
      notifyListeners();
    }
  }

  void removeNotification(String title) {
    _savedNotifications.removeWhere((event) => event['title'] == title);
    notifyListeners();
  }
}
