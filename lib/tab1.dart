// tab1 - 나영
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import './CourseClass.dart';
import './style.dart';
import './Mypage.dart';
import 'package:provider/provider.dart';
import 'UserInfo.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  late Map<String, dynamic> jsonData;
  late List<dynamic> courses;
  List<Course> c = List.empty(growable: true);

  getCourses() async{

    String jsonString = await rootBundle.loadString('assets/Courses.json');
    // print(jsonString.runtimeType); // String

    setState((){
      courses = jsonDecode(jsonString);
      //print(courses.length);
      for(int i = 0; i<courses.length; i++){
        jsonData = courses[i];
        Course course = Course.fromJson(jsonData);
        c.add(course);
        //print(c[i].time.runtimeType); // String
      }
      //print(c.runtimeType); // List<Course>
    });
  }

  List<Course> list1 = List.empty(growable: true); // 풍경
  List<Course> list2 = List.empty(growable: true); // 휠체어 구간
  List<Course> list3 = List.empty(growable: true); // 도보 소요 시간

  recCourses() async{ // 코스 추천
    for(int i = 0; i < c.length; i++ ){
      if(c[i].scenery.toString().contains('오름')){
        setState(() {
          list1.add(c[i]);
         // print(c[i].courseName);
        });
      }
    }
    for(int i = 0; i < list1.length; i++){
      if(c[i].isWheel == false){
        setState(() {
          list2.add(c[i]);
        });
      }
    }
    for(int i = 0; i < c.length; i++ ){
      if(c[i].time.runtimeType == int && c[i].time <= 60){ // 60분 이하
        setState(() {
          list3.add(c[i]);
         // print(c[i].time);
        });
      }
    }
  }

  start() async{
    await getCourses();
    await recCourses();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getCourses();
    start();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (c) => UserStore1(),
        child: Scaffold(
        body: ShowCourses(list1: list1, list2: list2, list3:list3),
      ),
    );
  }
}

class ShowCourses extends StatefulWidget {
  const ShowCourses({Key? key, this.list1, this.list2, this.list3}) : super(key: key);

  final list1;
  final list2;
  final list3;

  @override
  State<ShowCourses> createState() => _ShowCoursesState();
}

class _ShowCoursesState extends State<ShowCourses> {
  final TextStyle _style1 = const TextStyle(
   //color: Colors.black54,
    fontFamily: "Koddi",
    fontWeight: FontWeight.w600,
    fontSize: 30.0
  );
  final TextStyle _style2 = const TextStyle(
      fontFamily: "Koddi",
      fontWeight: FontWeight.w500,
      fontSize: 20.0
  );

  final TextStyle _style3 = const TextStyle(
      fontFamily: "Koddi",
      fontWeight: FontWeight.w500,
      fontSize: 20.0
  );

  BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      border: Border.all(color: Colors.black)
  );

  if()

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height:20),
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0.0),
          height: 60,
          child: Row(
            children: [
              const Icon(Icons.visibility_outlined, color: Colors.pinkAccent, size: 40.0 ,),
              const SizedBox(width: 20),
              Text('회원님이 좋아하는 풍경', style: _style1),
            ],
          ),
        ),
        Container(
          //margin: const EdgeInsets.symmetric(vertical: 20.0),
          margin: const EdgeInsets.all(10.0),
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.list1.length,
              itemBuilder: (context, i){
                return Container(
                  width: 600,
                  decoration: boxDecoration,
                  margin: const EdgeInsets.all(2.0),
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(widget.list1[i].courseName, style: _style2),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(widget.list1[i].courseNo, style: _style2),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.list1[i].startAddress, style: _style2),
                        )
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
        const Divider(),
        Container(
          margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          height: 25,
          child: Text('회원님이 선호하는 도보시간', style: _style1),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 300,


          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.list3.length,
              itemBuilder: (context, i){
                return Container(
                  width: 400,
                  decoration: boxDecoration,
                  margin: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Text(widget.list3[i].courseName, style: _style2,),
                      Text(widget.list3[i].courseNo, style: _style2),
                      Text(widget.list3[i].startAddress, style: _style2)
                    ],
                  ),
                );
              }
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          height: 25,
          child: Text('휠체어 구간을 찾는다면?', style: _style1),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.list2.length,
              itemBuilder: (context, i){
                return Container(
                  width: 400,
                  decoration: boxDecoration,
                  margin: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Text(widget.list2[i].courseName, style: _style2),
                      Text(widget.list2[i].courseNo.toString(), style: _style2),
                      Text(widget.list2[i].startAddress, style: _style2)
                    ],
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
}
