import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import './tab1.dart';
import './style.dart';
import './tab2.dart';
import './checkOptions.dart';
import './Mypage.dart';
import 'package:provider/provider.dart';
import 'UserInfo.dart';

void main() async {
  /*
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  runApp(MaterialApp(
      theme: theme,
      home: MyApp(),
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
        ChangeNotifierProvider(
            create: (context) => UserStore1(),
            child: Home()),
        Text('실시간 추천(세민)'),
        ChangeNotifierProvider(
            create: (context) => UserStore1(),
            child: MyPage())
      ][tab],
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