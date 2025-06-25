import 'product.dart';
import '../util/utils.dart';

class ShoppingMall {
  List<Product> productList;
  List<Product> cartList;
  int cartTotalPrice;

  ShoppingMall({
    required this.productList,
    required this.cartList,
    required this.cartTotalPrice,
  });

  //[1] 상품 목록을 출력하는 메서드
  showProducts() {
    for (var product in productList) {
      print("${product.name} / ${product.price}원");
    }
  }

  //[2] 상품을 장바구니에 담는 메서드
  addToCart(List<Product> productList) {
    String? inputName = Input.inputMessage("상품 이름을 입력해 주세요!\n");
    var isProduct = false;
    for (var product in productList) {
      if (product.name == inputName) {
        isProduct = true;

        try {
          String? inputCount = Input.inputMessage("상품 개수을 입력해 주세요!\n");
          if (inputCount != null) {
            var count = int.parse(inputCount);
            if (count > 0) {
              for (var i = 0; i < count; i++) {
                cartList.add(product);
              }
              print("장바구니에 상품이 담겼어요!\n");
            } else {
              print("0개보다 많은 개수의 상품만 담을 수 있어요!\n");
            }
          }
        } catch (e) {
          print("입력값이 올바르지 않아요!\n");
        }
      }
    }
    if (!isProduct) {
      print("입력값이 올바르지 않아요!\n");
      print("상품 이름을 제대로 입력해 주세요!\n");
    }
  }

  //[3] 장바구니에 담은 상품의 총 가격을 출력하는 메서드
  showTotal(List<Product> cartList) {
    if (cartList.isEmpty) {
      print("장바구니에 담긴 상품이 없습니다.\n");
    } else {
      cartTotalPrice = 0;
      for (var product in cartList) {
        cartTotalPrice += product.price;
      }
      var cartMsg = showCartList(cartList);
      print("장바구니에 $cartMsg가 담겨있네요. 총 $cartTotalPrice원 입니다!\n");
    }
  }

  String showCartList(List<Product> cartList) {
    Map<String, int> nameCount = {};
    String msg = "";
    for (var product in cartList) {
      String name = product.name;
      nameCount[name] = (nameCount[name] ?? 0) + 1;
    }
    int index = 0;
    for (var entry in nameCount.entries) {
      if (index == nameCount.length - 1) {
        msg += "${entry.key} ${entry.value}개";
      } else {
        msg += "${entry.key} ${entry.value}개,  ";
      }
      index++;
    }
    return msg;
  }

  //[4] 종료 확인
  bool endFun() {
    var endMsg = Input.inputMessage("정말 종료하시겠습니까? 종료를 원하시면 '5'를 입력해주세요\n");
    if (endMsg == "5") {
      print("이용해 주셔서 감사합니다~ 안녕히 가세요!");
      return true;
    } else {
      print("종료하지 않습니다.");
      return false;
    }
  }

  //[6] 장바구니 초기화
  resetCart(List<Product> cartList) {
    if (cartList.isEmpty) {
      print("이미 장바구니가 비어있습니다\n");
    } else {
      cartList.clear();
      print("장바구니를 비웠습니다!\n");
    }
  }
}
