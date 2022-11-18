import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class UserStore1 extends ChangeNotifier {
  List<bool> scenery = [false,false,true,false,false]; // '산', '바다', '오름', '시내','시골'
  List<bool> time = [false,true,false,false,false];
  bool wantWheel = true;

  changeScenery(List<bool> selected) {
    for(int i = 0; i < 5 ; i++){
      scenery = selected[i] as List<bool>;
    }
  }
}




