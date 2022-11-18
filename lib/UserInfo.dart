import 'package:circle_button/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './style.dart';


class UserStore1 extends ChangeNotifier {
  List<bool> scenery = [false,false,false,false,false];
  // '산', '바다', '오름', '시내','시골'
  List<bool> time = [false,false,false,false,false];
  bool wantWheel = true;

  var userScenery = ['오름'];
/*
  changeScenery(List<bool> selected) {
    for(int i = 0; i < 5 ; i++){
      scenery = selected[i] as List<bool>;
    }
    notifyListeners();
  }
  */
}

class UserPrefer extends StatefulWidget {
  const UserPrefer({Key? key}) : super(key: key);

  @override
  State<UserPrefer> createState() => _UserPreferState();
}

class _UserPreferState extends State<UserPrefer> {

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
  List<bool> isSelected3 = List<bool>.filled(1, false);
  List<Color> colors3 = List<Color>.filled(1, Colors.white);

  // 체험
  List<String> text4 = ['전시문화', '전통시장', '농어촌'];
  List<Icon> icons4 = [
    const Icon(Icons.museum_outlined, color: Colors.black, size: 50.0,),
    const Icon(Icons.storefront, color: Colors.black, size: 50.0,),
    const Icon(Icons.agriculture, color: Colors.black, size: 50.0,),
  ];
  List<bool> isSelected4 = List<bool>.filled(3, false);
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

  final TextStyle _style1 = const TextStyle(
      fontFamily: "Koddi",
      fontWeight: FontWeight.w600,
      fontSize: 30.0,
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 800,
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('나의 도보 여행 취향', style: _style1, textAlign: TextAlign.center,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close))],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: 100,
                  child: Center(child: Text('보기', style: _style1)),),
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
            Divider(),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: 100,
                  child: Center(child: Text('도보 시간', style: _style1, textAlign: TextAlign.center)),),
                Expanded(
                  child: Container(
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
                )]
                ),
            const Divider(),

            Row(
              children: [
                Container(
                margin: const EdgeInsets.all(5.0),
                width: 100,
                child: Center(child: Text('휠체어 구간', style: _style1, textAlign: TextAlign.center,)),),
                Expanded(
                  child: Container(
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
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Container(
                margin: const EdgeInsets.all(5.0),
                width: 100,
                 child: Center(child: Text('체험', style: _style1)),),
                Expanded(
                  child: Container(
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
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150.0, 50.0),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontFamily: "Koddi",
                    fontWeight: FontWeight.w600,
                    fontSize: 25.0,
                    color: Colors.white
                  ),
                  elevation: 1,
                ),
                child: Text('저장'))
          ]
        ),
      ),
    );
  }
}





