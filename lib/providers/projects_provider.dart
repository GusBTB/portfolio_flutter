import 'package:flutter/material.dart';

class ProjectsProvider with ChangeNotifier {
  bool nwOpen = false;
  bool gsOpen = false;
  bool myoOpen = false;
  bool portOpen = false;

  void setNwOpen() {
    nwOpen = !nwOpen;
    notifyListeners();
  }

  bool getNwOpen() {
    notifyListeners();
    return nwOpen;
  }

  void setGsOpen() {
    gsOpen = !gsOpen;
    notifyListeners();
  }

  bool getGsOpen() {
    return gsOpen;
  }

  void setMyoOpen() {
    myoOpen = !myoOpen;
    notifyListeners();
  }

  bool getMyoOpen() {
    return myoOpen;
  }

  void setPortOpen() {
    portOpen = !portOpen;
    notifyListeners();
  }

  bool getPortOpen() {
    return portOpen;
  }
}
