import 'dart:io';

class Input {
  static inputMessage(String? msg) {
    var menu =
        '''-------------------------------------------------------------------------------------------------------------------------
[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품, 총 가격 보기 / [4] 프로그램 종료 [6] 장바구니 초기화
-------------------------------------------------------------------------------------------------------------------------
''';
    stdout.write(msg ?? menu);
    String? input = stdin.readLineSync();
    return input;
  }
}

class Data {
  static var data = [
    {"name": "셔츠", "price": 45000},
    {"name": "원피스", "price": 30000},
    {"name": "반팔티", "price": 35000},
    {"name": "반바지", "price": 38000},
    {"name": "양말", "price": 5000},

    {"name": "Shirt", "price": 45000},
    {"name": "One piece", "price": 30000},
    {"name": "T shirt", "price": 35000},
    {"name": "Shorts", "price": 38000},
    {"name": "Socks", "price": 5000},
  ];
  static var adminKey = "1234";
}
