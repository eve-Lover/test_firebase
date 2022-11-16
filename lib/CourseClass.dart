class Course {
  dynamic courseNo;
  dynamic courseName;
  dynamic startName;
  dynamic startAddress;
  dynamic startMapY;
  dynamic startMapX;
  dynamic endName;
  dynamic endAddress;
  dynamic endMapY;
  dynamic endMapX;
  dynamic distance;
  dynamic time;
  dynamic isWheel;
  dynamic scenery;
  dynamic memo;

  Course(
      {
        required this.courseNo,
        required this.courseName,
        required this.startName,
        required this.startAddress,
        required this.startMapY,
        required this.startMapX,
        required this.endName,
        required this.endAddress,
        required this.endMapY,
        required this.endMapX,
        required this.distance,
        required this.time,
        required this.isWheel,
        required this.scenery,
        required this.memo});

  factory Course.fromJson(Map<String, dynamic> parsedJson) {
    return Course(
        courseNo: parsedJson['올레길 코스 번호'],
        courseName: parsedJson['올레길 코스 이름'],
        startName: parsedJson['시작점'],
        startAddress: parsedJson['시작점 주소'],
        startMapY: parsedJson['시작점 위도'],
        startMapX: parsedJson['시작점 경도'],
        endName: parsedJson['종점'],
        endAddress: parsedJson['종점 주소'],
        endMapY: parsedJson['종점 위도'],
        endMapX: parsedJson['종점 경도'],
        distance: parsedJson['총 길이(KM)'],
        time: parsedJson['예상 소요 시간(분)'],
        isWheel : parsedJson['휠체어 구간 유무'],
        scenery : parsedJson['풍경'],
        memo: parsedJson['비고']);
  }

}
