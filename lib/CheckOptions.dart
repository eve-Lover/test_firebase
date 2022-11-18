import 'package:flutter/material.dart';

class CheckOpt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top:20),
    child: Row(
      children: [
        _buildOption(Icons.landscape, "산"), SizedBox(width: 25),
        _buildOption(Icons.waves, "바다"), SizedBox(width: 25),
        _buildOption(Icons.forest, "숲"), SizedBox(width: 25),
        _buildOption(Icons.holiday_village, "민가"), SizedBox(width: 25),
      ],
    ),
    );
  }

  Widget _buildOption(IconData mIcon, String text) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(mIcon, color: Colors.blueGrey, size: 30),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}