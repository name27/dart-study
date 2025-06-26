import 'utils.dart';
import '../model/product.dart';

class Admin {
  //[0] 관리자 모드
  List<Product> adminMode(List<Product> productList) {
    String? adminKey = Input.inputMessage("adminkey: ");
    if (Data.adminKey != adminKey) {
      print("입력값이 올바르지 않아요!!\n");
      return productList;
    }

    print("[ 관리자 모드 ]\n");
    String menu = "[0] 관리자 모드 종료 [1] 상품 추가 [2] 상품 삭제 [3] 가격 변경\n";

    while (true) {
      switch (Input.inputMessage(menu)) {
        case '1':
          addProduct(productList);
          break;
        case '2':
          deleteProduct(productList);
          break;
        case '3':
          editPrice(productList);
          break;
        case '0':
          print("관리자 모드를 종료합니다");
          return productList;
        default:
          print("지원하지 않는 기능입니다! 다시 시도해주세요..");
      }
    }
  }

  void addProduct(List<Product> productList) {
    String? name = Input.inputMessage("추가할 상품명을 입력해 주세요!\n상품명: ");
    if (name == null || name.isEmpty) {
      print("입력값이 올바르지 않아요!!\n");
      return;
    }

    if (productList.any((product) => product.name == name)) {
      print("같은 상품명이 이미 있어요!\n");
      return;
    }

    String? priceStr = Input.inputMessage("가격을 입력해 주세요!\n가격: ");
    if (priceStr == null) {
      print("입력값이 올바르지 않아요!!\n");
      return;
    }

    try {
      int price = int.parse(priceStr);
      productList.add(Product(name: name, price: price));
      print("상품이 추가되었습니다!\n");
    } catch (e) {
      print("입력값이 올바르지 않아요!!\n");
    }
  }

  void deleteProduct(List<Product> productList) {
    String? name = Input.inputMessage("삭제할 상품명을 입력해 주세요!\n상품명: ");
    if (name == null || name.isEmpty) {
      print("입력값이 올바르지 않아요!!\n");
      return;
    }

    if (productList.any((product) => product.name == name)) {
      productList.removeWhere((product) => product.name == name);
      print("상품이 삭제되었습니다!\n");
    } else {
      print("해당 상품이 존재하지 않습니다!\n");
    }
  }

  void editPrice(List<Product> productList) {
    String? name = Input.inputMessage("가격을 변경할 상품명을 입력 해주세요!\n상품명: ");
    if (name == null || name.isEmpty) {
      print("입력값이 올바르지 않아요!\n");
      return;
    }

    int index = productList.indexWhere((product) => product.name == name);
    if (index == -1) {
      print("해당 상품이 존재하지 않습니다!\n");
      return;
    }

    String? priceStr = Input.inputMessage("변경할 가격을 입력 해주세요!\n가격: ");
    if (priceStr == null || priceStr.isEmpty) {
      print("입력값이 올바르지 않아요!\n");
      return;
    }

    try {
      int newPrice = int.parse(priceStr);
      productList[index].price = newPrice;
      print("$name 의 상품 가격이 $newPrice 으로 변경되었습니다!\n");
    } catch (e) {
      print("입력값이 올바르지 않아요!\n");
    }
  }
}

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
