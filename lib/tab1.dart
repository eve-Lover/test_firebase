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
       // print(c[i].isWheel.runtimeType); // String
      }
      //print(c.runtimeType); // List<Course>
    });
  }

  List<Course> list1 = List.empty(growable: true); // 풍경
  List<Course> list2 = List.empty(growable: true); // 휠체어 구간
  List<Course> list3 = List.empty(growable: true); // 도보 소요 시간

  recCourses() async{ // 코스 추천

    for(int i = 0; i < c.length; i++ ){
      print(c[i].isWheel.runtimeType);
      if(c[i].scenery.toString().contains('오름')){
       setState(() {
          list1.add(c[i]);
  // print(c[i].courseName);
       });
      }
     if(c[i].time.runtimeType == int && c[i].isWheel.toString().contains('true')){
       setState(() {
         list2.add(c[i]);
        });
      }
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
    super.initState();
    start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ShowCourses(list1: list1, list2: list2, list3:list3),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.place_outlined),
          onPressed: (){}, // 지도로 조회
          backgroundColor: Colors.teal,
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
      fontSize: 25.0
  );

  final TextStyle _style3 = const TextStyle(
      fontFamily: "Koddi",
      fontWeight: FontWeight.w500,
      fontSize: 18.0
  );
  BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      border: Border.all(color: Colors.black)
  );


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
              //const Icon(Icons.visibility_outlined, color: Colors.pinkAccent, size: 40.0 ,),
              //const SizedBox(width: 20),
              Text('오름 구간을 좋아하시나요?', style: _style1),
              //TextButton(onPressed: (){}, child: Text('가까운 순으로 보기'),),
              //TextButton(onPressed: (){}, child: Text('지도로 보기'),),
            ],
          ),
        ),
        Container(
          //margin: const EdgeInsets.symmetric(vertical: 20.0),
          margin: const EdgeInsets.all(10.0),
          height: 350,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.list1.length,
              itemBuilder: (context, i){
                return Container(
                  width: 600,
                  decoration: boxDecoration,
                  margin: const EdgeInsets.all(2.0),
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                          child: Row(mainAxisAlignment:MainAxisAlignment.end,
                              children: [IconButton(onPressed: (){},
                                  icon: const Icon(Icons.favorite_outline_rounded))],),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
                          child: Row(
                            children: [
                              const Icon(Icons.landscape, color: Colors.greenAccent, size: 40.0,),
                              Text(widget.list1[i].courseName, style: _style2,),
                            ],
                          ),
                        ),
                        /*Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(widget.list1[i].courseNo, style: _style2),
                        ),*/
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.location_pin, size: 30.0,),
                              Text('출발지: ', style: _style3),
                              Expanded(child: Text(widget.list1[i].startAddress, style: _style3)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.location_pin, size: 30.0,),
                              Text('도착지: ', style: _style3,),
                              Expanded(child: Text('${widget.list1[i].endAddress}', style: _style3)),
                            ],
                          ),
                        ),
                        /* 풍경
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.remove_red_eye, size: 30.0,),
                              Text('풍경: ', style: _style3,),
                              Builder(builder: (c){
                                if(widget.list1[i].scenery.contains('오름')){
                                  return  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white,
                                        border: Border.all(color: Colors.grey)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.eject, color: Colors.lightGreen,),
                                          Text('오름', style: _style3,),
                                        ],
                                      ),
                                    ),
                                  );
                                }else if(widget.list1[i].scenery.contains('산')) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white,
                                        border: Border.all(color: Colors.grey)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.landscape_outlined, color: Colors.lightGreen,),
                                          Text('산', style: _style3,),
                                        ],
                                      ),
                                    ),
                                  );
                                    //
                                }else if(widget.list1[i].scenery.contains('바다')) {
                                  return const Icon(Icons.beach_access_outlined);
                                }else if(widget.list1[i].scenery.contains('시내')) {
                                  return const Icon(Icons.location_city);
                                }else if(widget.list1[i].scenery.contains('시골')) {
                                  return const Icon(Icons.nature);
                                }else
                                  return Icon(Icons.forest);
                              }),
                            ]
                          ),),
*/
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Icon(Icons.accessible_outlined),
                              Text('휠체어 구간 : ', style: _style3,),
                              Builder(builder: (c){
                                if(widget.list1[i].isWheel.toString().contains('true')) {
                                  return const Icon(Icons.circle_outlined);
                                }else{
                                  return const Icon(Icons.close);
                                }
                              }),
                              const SizedBox(width: 20,),
                              const Icon(Icons.update_outlined),
                              Text('도보 시간: ${widget.list1[i].time}분', style: _style3,),
                              const SizedBox(width: 20,),
                              const Icon(Icons.directions_walk),
                              Text('도보 거리: ${widget.list1[i].distance}km', style: _style3,),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.rate_review_rounded),
                              Text('리뷰 및 평점', style: _style3,),
                              const SizedBox(width: 20,),
                              Text('★★★', style: _style3,)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                                child: Row(
                                  children: [
                                    const Icon(Icons.details),
                                    Text('상세정보', style: _style3,),
                                  ],),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(150.0, 20.0),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  elevation: 1,
                                ),
                                onPressed: (){}),
                          ),
                        )

                      ],
                    ),
                  ),
                );
              }
          ),
        ),
        const Divider(),
        const SizedBox(height:20),
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0.0),
          height: 60,
          child: Row(
            children: [
              //const Icon(Icons.visibility_outlined, color: Colors.pinkAccent, size: 40.0 ,),
              //const SizedBox(width: 20),
              Text('휠체어 구간을 찾고 계시나요?', style: _style1),
              //TextButton(onPressed: (){}, child: Text('가까운 순으로 보기'),),
              //TextButton(onPressed: (){}, child: Text('지도로 보기'),),
            ],
          ),
        ),
        Container(
          //margin: const EdgeInsets.symmetric(vertical: 20.0),
          margin: const EdgeInsets.all(10.0),
          height: 350,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.list2.length,
              itemBuilder: (context, i){
                return Container(
                  width: 600,
                  decoration: boxDecoration,
                  margin: const EdgeInsets.all(2.0),
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                          child: Row(mainAxisAlignment:MainAxisAlignment.end,
                            children: [IconButton(onPressed: (){},
                                icon: const Icon(Icons.favorite_outline_rounded))],),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
                          child: Row(
                            children: [
                              //const Icon(Icons.landscape, color: Colors.greenAccent, size: 40.0,),
                              Text(widget.list2[i].courseName, style: _style2,),
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.location_pin, size: 30.0,),
                              Text('출발지: ', style: _style3),
                              Expanded(child: Text(widget.list2[i].startAddress, style: _style3)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.location_pin, size: 30.0,),
                              Text('도착지: ', style: _style3,),
                              Expanded(child: Text('${widget.list2[i].endAddress}', style: _style3)),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Icon(Icons.accessible_outlined),
                              Text('휠체어 구간 : ', style: _style3,),
                              Builder(builder: (c){
                                if(widget.list2[i].isWheel.toString().contains('true') ) {
                                  return const Icon(Icons.circle_outlined);
                                }else{
                                  return Icon(Icons.close);
                                }
                              }),
                              SizedBox(width: 20,),
                              Icon(Icons.update_outlined),
                              Text('도보 시간: ${widget.list2[i].time}분', style: _style3,),
                              SizedBox(width: 20,),
                              Icon(Icons.directions_walk),
                              Text('도보 거리: ${widget.list2[i].distance}km', style: _style3,),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.rate_review_rounded),
                              Text('리뷰 및 평점', style: _style3,),
                              const SizedBox(width: 20,),
                              Text('★★★', style: _style3,)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                                child: Row(
                                  children: [
                                    const Icon(Icons.details),
                                    Text('상세정보', style: _style3,),
                                  ],),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(150.0, 20.0),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  elevation: 1,
                                ),
                                onPressed: (){}),
                          ),
                        )

                      ],
                    ),
                  ),
                );
              }
          ),
        ),
        const Divider(),
        const SizedBox(height:20),
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0.0),
          height: 60,
          child: Row(
            children: [
              //const Icon(Icons.visibility_outlined, color: Colors.pinkAccent, size: 40.0 ,),
              //const SizedBox(width: 20),
              Text('60분 미만의 도보 구간을 찾고 계시나요?', style: _style1),
              //TextButton(onPressed: (){}, child: Text('가까운 순으로 보기'),),
              //TextButton(onPressed: (){}, child: Text('지도로 보기'),),
            ],
          ),
        ),
        Container(
          //margin: const EdgeInsets.symmetric(vertical: 20.0),
          margin: const EdgeInsets.all(10.0),
          height: 350,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.list3.length,
              itemBuilder: (context, i){
                return Container(
                  width: 600,
                  decoration: boxDecoration,
                  margin: const EdgeInsets.all(2.0),
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                          child: Row(mainAxisAlignment:MainAxisAlignment.end,
                            children: [IconButton(onPressed: (){},
                                icon: const Icon(Icons.favorite_outline_rounded))],),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
                          child: Row(
                            children: [
                              //const Icon(Icons.landscape, color: Colors.greenAccent, size: 40.0,),
                              Text(widget.list3[i].courseName, style: _style2,),
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.location_pin, size: 30.0,),
                              Text('출발지: ', style: _style3),
                              Expanded(child: Text(widget.list3[i].startAddress, style: _style3)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.location_pin, size: 30.0,),
                              Text('도착지: ', style: _style3,),
                              Expanded(child: Text('${widget.list3[i].endAddress}', style: _style3)),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Icon(Icons.accessible_outlined),
                              Text('휠체어 구간 : ', style: _style3,),
                              Builder(builder: (c){
                                if(widget.list3[i].isWheel == 'true') {
                                  return const Icon(Icons.circle_outlined);
                                }else{
                                  return Icon(Icons.close);
                                }
                              }),
                              SizedBox(width: 20,),
                              Icon(Icons.update_outlined),
                              Text('도보 시간: ${widget.list3[i].time}분', style: _style3,),
                              SizedBox(width: 20,),
                              Icon(Icons.directions_walk),
                              Text('도보 거리: ${widget.list3[i].distance}km', style: _style3,),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.rate_review_rounded),
                              Text('리뷰 및 평점', style: _style3,),
                              const SizedBox(width: 20,),
                              Text('★★★', style: _style3,)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                                child: Row(
                                  children: [
                                    const Icon(Icons.details),
                                    Text('상세정보', style: _style3,),
                                  ],),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(150.0, 20.0),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  elevation: 1,
                                ),
                                onPressed: (){}),
                          ),
                        )

                      ],
                    ),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
}
