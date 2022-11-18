import 'package:flutter/material.dart';
import 'package:test_firebase/CheckOptions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckOpt(),
    );
  }
}

class TapTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildTapTwoAppBar(), // 앱 바 연결
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20), // 수평 여백 20
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
          children: [
          ],
        ),
      ),
    );
  }
  AppBar _buildTapTwoAppBar() {
    return AppBar();
  }


}