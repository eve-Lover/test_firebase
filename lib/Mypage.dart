import 'package:flutter/material.dart';
import 'package:circle_button/circle_button.dart';
import './UserInfo.dart';
// 나영 작업중

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  // Color color = Colors.white;
  final TextStyle _style1 = const TextStyle(
    fontFamily: "Koddi",
    fontWeight: FontWeight.w600,
    fontSize: 30.0,
  );
// 풍경


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(Icons.person, size: 100.0,),
              Text('사용자 이름', style: _style1,),
              Expanded(child: SizedBox()),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserPrefer()
                      ));
                },
                child: Icon(Icons.settings),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(50.0, 20.0),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  elevation: 1,
                ),)
            ],
          ),
        ),



      ],
    );
  }
}

