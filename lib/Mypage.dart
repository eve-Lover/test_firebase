import 'package:flutter/material.dart';
import 'package:circle_button/circle_button.dart';
// 나영 작업중

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  // Color color = Colors.white;
  List<String> typeOfScenery = ['산', '바다', '오름', '시내','시골'];
  List<Icon> icons = [
    const Icon(Icons.landscape, color: Colors.black, size: 50.0,),
    const Icon(Icons.beach_access, color: Colors.black, size: 50.0,),
    const Icon(Icons.eject, color: Colors.black, size: 50.0,),
    const Icon(Icons.location_city,color: Colors.black, size: 50.0, ),
    const Icon(Icons.nature,color: Colors.black, size: 50.0,)
  ];
  List<bool> isSelected = List<bool>.filled(5, true);
  List<Color> colors = List<Color>.filled(5, Colors.white);

  changeColor(int i) {
    if(isSelected[i] == false){
      setState((){
        colors[i] = Colors.pinkAccent;
        isSelected[i] = true;
      });
    }else{
      setState(() {
        colors[i] = Colors.white;
        isSelected[i] = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: typeOfScenery.length,
        itemBuilder: (c,i){
          return CircleButton( // 산
            onTap: () => changeColor(i),
            tooltip: 'Circle Button',
            width: 100.0,
            height: 100.0,
            borderColor: Colors.grey,
            borderWidth: 2.0,
            borderStyle: BorderStyle.solid,
            backgroundColor: colors[i],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icons[i],
                Text(typeOfScenery[i])
              ],
            ),
          );
        },
      ),


    );
  }
}
