import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import './tab1.dart';

void main() async {
  /*
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  runApp(MaterialApp(
      home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final title=  TextStyle(color: Colors.black, fontSize: 25);

  int tab = 0; // 현재 탭의 상태 : 0(홈), 1(샵)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('어디올레', style: title),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: (){},
            iconSize: 30,
          )
        ],
      ),
      body: [Home(), Text('실시간 추천(세민)')][tab],
      bottomNavigationBar: BottomNavigationBar(
        onTap : (i){
          setState(() {
            tab = i;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'shop'),
        ],

      ),
    );
  }
}