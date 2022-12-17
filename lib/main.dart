import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import './tab1.dart';
import './style.dart';
import './tab2.dart';
import './checkOptions.dart';

import 'package:provider/provider.dart';
import './Mypage.dart';
import 'UserInfo.dart';

void main() async {
  /*
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  runApp(ChangeNotifierProvider(
    create: (c) => UserStore1(),
    child: MaterialApp(
        theme: theme,
        home: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final title=  const TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontFamily: "Koddi",
      fontWeight: FontWeight.w700
  );

  int tab = 0; // 현재 탭의 상태 : 0(홈), 1(샵)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('어디올레', style: title), centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            onPressed: (){},
            iconSize: 30,
          )
        ],
      ),
      body: [
        MyPage()/*Home()*/,
        Text('실시간 추천(세민)'),
        MyPage()][tab],
      bottomNavigationBar: BottomNavigationBar(
        onTap : (i){
          setState(() {
            tab = i;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'shop'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'mypage'),
        ],

      ),
    );
  }
}


class UserStore1 extends ChangeNotifier {

  /*------------------------------------------------------------------*/
  // '선호도 1: 보기'
  List<bool> isSelected1 = List<bool>.filled(5, false);
  // '산', '바다', '오름', '시내','시골'

  List<String> text1 = ['산', '바다', '오름', '시내','시골'];
  List<Icon> icons1 = [
    const Icon(Icons.landscape, color: Colors.black, size: 50.0,),
    const Icon(Icons.beach_access, color: Colors.black, size: 50.0,),
    const Icon(Icons.eject, color: Colors.black, size: 50.0,),
    const Icon(Icons.location_city,color: Colors.black, size: 50.0, ),
    const Icon(Icons.nature,color: Colors.black, size: 50.0,)
  ];
  List<Color> colors1 = List<Color>.filled(5, Colors.white);

  /*------------------------------------------------------------------*/
  // 선호도 2 : 도보 시간
  List<bool> isSelected2 = List<bool>.filled(4, false);
  List<String> text2 = ['30분 미만', '60분 미만', '90분 미만', '90분 이상'];
  List<Color> colors2 = List<Color>.filled(4, Colors.white);

  /*------------------------------------------------------------------*/
  // 선호도 3: 휠체어 구간 필요 유무
  List<bool> isSelected3 = List<bool>.filled(1, false);
  List<String> text3 = ['필요'];
  List<Icon> icons3 = [
    const Icon(Icons.accessible_forward, color: Colors.black, size: 50.0,),
  ];
  List<Color> colors3 = List<Color>.filled(1, Colors.white);

  /*------------------------------------------------------------------*/
  // 선호도 4: 체험
  List<String> text4 = ['전시문화', '전통시장', '농어촌'];
  List<Icon> icons4 = [
    const Icon(Icons.museum_outlined, color: Colors.black, size: 50.0,),
    const Icon(Icons.storefront, color: Colors.black, size: 50.0,),
    const Icon(Icons.agriculture, color: Colors.black, size: 50.0,),
  ];

  List<bool> isSelected4 = List<bool>.filled(3, false);
  List<Color> colors4 = List<Color>.filled(3, Colors.white);




/*
  changeScenery(List<bool> selected) {
    for(int i = 0; i < 5 ; i++){
      scenery = selected[i] as List<bool>;
    }
    notifyListeners();
  }
  */
}




