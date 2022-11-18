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

// 풍경

  List<String> text1 = ['산', '바다', '오름', '시내','시골'];
  List<Icon> icons1 = [
    const Icon(Icons.landscape, color: Colors.black, size: 50.0,),
    const Icon(Icons.beach_access, color: Colors.black, size: 50.0,),
    const Icon(Icons.eject, color: Colors.black, size: 50.0,),
    const Icon(Icons.location_city,color: Colors.black, size: 50.0, ),
    const Icon(Icons.nature,color: Colors.black, size: 50.0,)
  ];
  List<bool> isSelected1 = List<bool>.filled(5, false);
  List<Color> colors1 = List<Color>.filled(5, Colors.white);

// 도보 시간
  List<String> text2 = ['30분 미만', '60분 미만', '90분 미만', '90분 이상'];
  List<bool> isSelected2 = List<bool>.filled(4, false);
  List<Color> colors2 = List<Color>.filled(4, Colors.white);

  // 휠체어 구간 유무
  List<String> text3 = ['필요'];
  List<Icon> icons3 = [
    const Icon(Icons.accessible_forward, color: Colors.black, size: 50.0,),
  ];
  List<bool> isSelected3 = List<bool>.filled(1, true);
  List<Color> colors3 = List<Color>.filled(1, Colors.white);

  // 체험
  List<String> text4 = ['전시문화', '전통시장', '농어촌'];
  List<Icon> icons4 = [
    const Icon(Icons.museum_outlined, color: Colors.black, size: 50.0,),
    const Icon(Icons.storefront, color: Colors.black, size: 50.0,),
    const Icon(Icons.agriculture, color: Colors.black, size: 50.0,),
  ];
  List<bool> isSelected4 = List<bool>.filled(3, true);
  List<Color> colors4 = List<Color>.filled(3, Colors.white);

  changeColor(List isSelected, List colors, int i) {
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
      body:  Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5.0),
                width: 50,
                child: const Center(child: Text('풍경')),),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  height: 100,
                  child: ListView.builder( // 풍경 선택
                    scrollDirection: Axis.horizontal,
                    itemCount: text1.length,
                    itemBuilder: (c,i){
                      return CircleButton( // 산
                        onTap: () => changeColor(isSelected1, colors1, i),
                        tooltip: 'Circle Button',
                        width: 100.0,
                        height: 100.0,
                        borderColor: Colors.grey,
                        borderWidth: 2.0,
                        borderStyle: BorderStyle.solid,
                        backgroundColor: colors1[i],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            icons1[i],
                            Text(text1[i])
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 100,
            child: ListView.builder( //
              scrollDirection: Axis.horizontal,
              itemCount: text2.length,
              itemBuilder: (c,i){
                return CircleButton( // 산
                  onTap: () => changeColor(isSelected2, colors2, i),
                  tooltip: 'Circle Button',
                  width: 100.0,
                  height: 100.0,
                  borderColor: Colors.grey,
                  borderWidth: 2.0,
                  borderStyle: BorderStyle.solid,
                  backgroundColor: colors2[i],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //icons2[i],
                      Text(text2[i])
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 100,
            child: ListView.builder( //
              scrollDirection: Axis.horizontal,
              itemCount: text3.length,
              itemBuilder: (c,i){
                return CircleButton( // 산
                  onTap: () => changeColor(isSelected3, colors3, i),
                  tooltip: 'Circle Button',
                  width: 100.0,
                  height: 100.0,
                  borderColor: Colors.grey,
                  borderWidth: 2.0,
                  borderStyle: BorderStyle.solid,
                  backgroundColor: colors3[i],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icons3[i],
                      Text(text3[i])
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 100,
            child: ListView.builder( //
              scrollDirection: Axis.horizontal,
              itemCount: text4.length,
              itemBuilder: (c,i){
                return CircleButton( // 산
                  onTap: () => changeColor(isSelected4, colors4, i),
                  tooltip: 'Circle Button',
                  width: 100.0,
                  height: 100.0,
                  borderColor: Colors.grey,
                  borderWidth: 2.0,
                  borderStyle: BorderStyle.solid,
                  backgroundColor: colors4[i],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icons4[i],
                      Text(text4[i])
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
