// tab1 - 나영
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import './CourseClass.dart';
import './style.dart';


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
    return Scaffold(
      body: ShowCourses(list1: list1, list2: list2, list3:list3),
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
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          height: 25,
          child: const Text('회원님이 좋아하는 풍경', style: TextStyle(fontSize: 20.0),),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.list1.length,
              itemBuilder: (context, i){
                return Container(
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.black)
                  ),
                  margin: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Text(widget.list1[i].courseName),
                      Text(widget.list1[i].courseNo),
                      Text(widget.list1[i].startAddress)
                    ],
                  ),
                );
              }
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          height: 25,
          child: const Text('회원님이 선호하는 도보시간', style: TextStyle(fontSize: 20.0),),
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.black)
                  ),
                  margin: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Text(widget.list3[i].courseName),
                      Text(widget.list3[i].courseNo),
                      Text(widget.list3[i].startAddress)
                    ],
                  ),
                );
              }
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          height: 25,
          child: const Text('휠체어 구간을 찾는다면?', style: TextStyle(fontSize: 20.0),),
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.black)
                  ),
                  margin: EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Text(widget.list2[i].courseName),
                      Text(widget.list2[i].courseNo.toString()),
                      Text(widget.list2[i].startAddress)
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
