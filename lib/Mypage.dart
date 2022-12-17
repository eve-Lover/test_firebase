import 'package:flutter/material.dart';
import 'package:circle_button/circle_button.dart';
import 'package:test_firebase/style.dart';
import './UserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
// 나영 작업중



class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  // Color color = Colors.white;
  final TextStyle _style1 = const TextStyle(
    //color: Colors.black54,
      fontFamily: "Koddi",
      fontWeight: FontWeight.w600,
      fontSize: 30.0
  );
  final TextStyle _style2 = const TextStyle(
      fontFamily: "Koddi",
      fontWeight: FontWeight.w500,
      fontSize: 25.0
  );
  final TextStyle _style3 = const TextStyle(
      fontFamily: "Koddi",
      fontWeight: FontWeight.w500,
      fontSize: 18.0
  );

  final BoxDecoration _boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      border: Border.all(color: Colors.grey)
  );


// 풍경
  /*
  savePrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs에 사용자 취향 정보 저장됨
    prefs.setStringList('보기', scneryList);
    prefs.setStringList('도보 시간', timeList);
    prefs.setBool('휠체어 구간', wantWheel);
    prefs.setStringList('체험', experenceList);
  }
*/

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const Icon(Icons.person, size: 100.0,),
              Text('사용자 이름', style: _style1,),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text('나의 도보 취향', style: _style1,),
              const Expanded(child: SizedBox()),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserPrefer()
                      ));
                },
                child: Icon(Icons.settings),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(50.0, 20.0),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  elevation: 1,
                ),)
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: _boxDecoration,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('보기', style: _style2),
              Text('도보 구간', style: _style2),
              Text('', style: _style2),
            ],
          ),
        )

      ],
    );
  }
}
