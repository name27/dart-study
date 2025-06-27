import 'utils.dart';
import '../model/product.dart';

class Admin {
  // [0] 관리자 모드 진입
  List<Product> adminMode(List<Product> productList) {
    final adminKey = _prompt("adminkey: ");
    if (adminKey != Data.adminKey) {
      print("입력값이 올바르지 않아요!!\n");
      return productList;
    }

    print("[ 관리자 모드 ]\n");
    const menu = "[0] 관리자 모드 종료 [1] 상품 추가 [2] 상품 삭제 [3] 가격 변경\n";

    while (true) {
      switch (_prompt(menu)) {
        case '1':
          _addProduct(productList);
          break;
        case '2':
          _deleteProduct(productList);
          break;
        case '3':
          _editPrice(productList);
          break;
        case '0':
          print("관리자 모드를 종료합니다");
          return productList;
        default:
          print("지원하지 않는 기능입니다! 다시 시도해주세요..\n");
      }
    }
  }

  void _addProduct(List<Product> productList) {
    final name = _prompt("추가할 상품명을 입력해 주세요!\n상품명: ");
    if (_isInvalid(name)) return;

    if (productList.any((p) => p.name == name)) {
      print("같은 상품명이 이미 있어요!\n");
      return;
    }

    final priceStr = _prompt("가격을 입력해 주세요!\n가격: ");
    final price = _parseInt(priceStr);
    if (price == null) return;

    productList.add(Product(name: name!, price: price));
    print("상품이 추가되었습니다!\n");
  }

  void _deleteProduct(List<Product> productList) {
    final name = _prompt("삭제할 상품명을 입력해 주세요!\n상품명: ");
    if (_isInvalid(name)) return;

    final before = productList.length;
    productList.removeWhere((p) => p.name == name);
    final after = productList.length;

    if (before != after) {
      print("상품이 삭제되었습니다!\n");
    } else {
      print("해당 상품이 존재하지 않습니다!\n");
    }
  }

  void _editPrice(List<Product> productList) {
    final name = _prompt("가격을 변경할 상품명을 입력 해주세요!\n상품명: ");
    if (_isInvalid(name)) return;

    final index = productList.indexWhere((p) => p.name == name);
    if (index == -1) {
      print("해당 상품이 존재하지 않습니다!\n");
      return;
    }

    final priceStr = _prompt("변경할 가격을 입력 해주세요!\n가격: ");
    final newPrice = _parseInt(priceStr);
    if (newPrice == null) return;

    productList[index].price = newPrice;
    print("$name 의 상품 가격이 $newPrice 원으로 변경되었습니다!\n");
  }

  String? _prompt(String message) => Input.inputMessage(message);

  bool _isInvalid(String? input) {
    if (input == null || input.trim().isEmpty) {
      print("입력값이 올바르지 않아요!!\n");
      return true;
    }
    return false;
  }

  int? _parseInt(String? input) {
    try {
      return int.parse(input ?? '');
    } catch (_) {
      print("입력값이 올바르지 않아요!!\n");
      return null;
    }
  }
}

// 위 코드는 AI가 아래 코드 리팩토링한 코드
// 아래 코드는 일일히 제가 짠 코드

// import 'utils.dart';
// import '../model/product.dart';

// class Admin {
//   //[0] 관리자 모드
//   List<Product> adminMode(List<Product> productList) {
//     String? adminKey = Input.inputMessage("adminkey: ");
//     bool adminEnd = true;
//     List<Product> returnList = productList;
//     if (Data.adminKey == adminKey) {
//       print("[ 관리자 모드 ] \n]");
//       var adminMenu = "[0] 관리자 모드 종료 [1] 상품 추가 [2] 상품 삭제 [3] 가격 변경\n";
//       while (adminEnd) {
//         switch (Input.inputMessage(adminMenu)) {
//           case '1':
//             returnList = addProduct(productList) ?? productList;
//             break;
//           case '2':
//             returnList = deleteProduct(productList) ?? productList;
//             break;
//           case '3':
//             returnList = editPrice(productList) ?? productList;
//             break;
//           case '0':
//             print("관리자 모드를 종료합니다");
//             adminEnd = false;
//             break;
//           default:
//             print("지원하지 않는 기능입니다! 다시 시도해주세요..");
//         }
//       }
//     } else {
//       print("입력값이 올바르지 않아요!!\n");
//     }
//     return returnList;
//   }

//   List<Product>? addProduct(List<Product> productList) {
//     String? addName = Input.inputMessage("추가할 상품명을 입력해 주세요!\n상품명: ");
//     var isProduct = false;
//     if (addName != null && addName != "") {
//       for (var product in productList) {
//         if (product.name == addName) {
//           print(product.name.contains(addName));
//           print("같은 상품명이 이미 있어요!\n");
//           isProduct = true;
//         }
//       }
//       if (!isProduct) {
//         try {
//           String? addPrice = Input.inputMessage("가격을 입력해 주세요!\n가격: ");
//           if (addPrice != null) {
//             var price = int.parse(addPrice);
//             print("상품이 추가되었습니다!\n");
//             productList.add(Product(name: addName, price: price));
//             return productList;
//           }
//         } catch (e) {
//           print("입력값이 올바르지 않아요!!\n");
//         }
//       }
//     } else {
//       print("입력값이 올바르지 않아요!!\n");
//     }
//     return null;
//   }

//   List<Product>? deleteProduct(List<Product> productList) {
//     String? delName = Input.inputMessage("삭제할 상품명을 입력해 주세요!\n상품명: ");
//     var isProduct = false;
//     if (delName != null && delName != "") {
//       for (var product in productList) {
//         if (product.name == delName) {
//           print(product.name.contains(delName));
//           isProduct = true;
//           productList.removeWhere((item) => item.name == delName);
//           print("상품이 삭제되었습니다!\n");
//           return productList;
//         }
//       }
//     }
//     if (!isProduct) {
//       print("입력값이 올바르지 않아요!!\n");
//     }
//     return null;
//   }

//   List<Product>? editPrice(List<Product> productList) {
//     String? editName = Input.inputMessage("가격을 변경할 상품명을 입력 해주세요!\n상품명: ");
//     var index = productList.indexWhere((e) => e.name == editName);
//     print(index);
//     var isProduct = false;
//     if (editName != null && editName != "") {
//       for (var product in productList) {
//         if (product.name == editName) {
//           try {
//             String? editPrice = Input.inputMessage("변경할 가격을 입력 해주세요!\n가격: ");
//             if (editPrice != null && editPrice != "" && index >= 0) {
//               var price = int.parse(editPrice);
//               productList[index].price = price;
//               print("$editName 의 상품 가격이 $editPrice 으로 변경되었습니다!\n");
//               isProduct = true;
//               return productList;
//             }
//           } catch (e) {
//             print("입력값이 올바르지 않아요!\n");
//           }
//           isProduct = true;
//         }
//       }
//       if (!isProduct) {
//         print("상품명을 찾을 수 없어요!\n");
//       }
//     } else {
//       print("입력값이 올바르지 않아요!\n");
//     }

//     return null;
//   }
// }
