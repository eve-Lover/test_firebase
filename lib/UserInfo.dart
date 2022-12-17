import 'package:circle_button/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Mypage.dart';
import 'package:provider/provider.dart';
import './style.dart';
import 'main.dart';


class UserPrefer extends StatefulWidget {
  const UserPrefer({Key? key}) : super(key: key);

  @override
  State<UserPrefer> createState() => _UserPreferState();
}

class _UserPreferState extends State<UserPrefer> {

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
      child: ListView(
        children: [
          Container(
            height: 800,
            margin: const EdgeInsets.all(20.0),
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
                          itemCount: context.watch<UserStore1>().text1.length,
                          itemBuilder: (c,i){
                            return CircleButton( // 산
                              onTap: () => changeColor(
                                  context.watch<UserStore1>().isSelected1,
                                  context.watch<UserStore1>().colors1,
                                  i),
                              tooltip: 'Circle Button',
                              width: 100.0,
                              height: 100.0,
                              borderColor: Colors.grey,
                              borderWidth: 2.0,
                              borderStyle: BorderStyle.solid,
                              backgroundColor: context.watch<UserStore1>().colors1[i],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  context.watch<UserStore1>().icons1[i],
                                  Text(context.watch<UserStore1>().text1[i])
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
                            itemCount: context.watch<UserStore1>().text2.length,
                            itemBuilder: (c,i){
                              return CircleButton( // 산
                                onTap: () => changeColor(
                                    context.watch<UserStore1>().isSelected2,
                                    context.watch<UserStore1>().colors2,
                                    i),
                                tooltip: 'Circle Button',
                                width: 100.0,
                                height: 100.0,
                                borderColor: Colors.grey,
                                borderWidth: 2.0,
                                borderStyle: BorderStyle.solid,
                                backgroundColor: context.watch<UserStore1>().colors2[i],
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //icons2[i],
                                    Text(context.watch<UserStore1>().text2[i])
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
                          itemCount: context.watch<UserStore1>().text3.length,
                          itemBuilder: (c,i){
                            return CircleButton( // 산
                              onTap: () => changeColor(
                                  context.watch<UserStore1>().isSelected3,
                                  context.watch<UserStore1>().colors3,
                                  i),
                              tooltip: 'Circle Button',
                              width: 100.0,
                              height: 100.0,
                              borderColor: Colors.grey,
                              borderWidth: 2.0,
                              borderStyle: BorderStyle.solid,
                              backgroundColor: context.watch<UserStore1>().colors3[i],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  context.watch<UserStore1>().icons3[i],
                                  Text(context.watch<UserStore1>().text3[i])
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
                          itemCount: context.watch<UserStore1>().text4.length,
                          itemBuilder: (c,i){
                            return CircleButton( // 산
                              onTap: () => changeColor(
                                  context.watch<UserStore1>().isSelected4,
                                  context.watch<UserStore1>().colors4,
                                  i),
                              tooltip: 'Circle Button',
                              width: 100.0,
                              height: 100.0,
                              borderColor: Colors.grey,
                              borderWidth: 2.0,
                              borderStyle: BorderStyle.solid,
                              backgroundColor: context.watch<UserStore1>().colors4[i],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  context.watch<UserStore1>().icons4[i],
                                  Text(context.watch<UserStore1>().text4[i])
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    child: Text('저장'),
                    onPressed: (){
                      Navigator.pop(context);
                       // context.read<UserStore1>().saveData();
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
                    )
              ]
            ),
          ),
        ],
      ),
    );
  }
}





