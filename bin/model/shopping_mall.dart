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

  // [1] 상품 목록 보기
  void showProducts() {
    for (var product in productList) {
      print("${product.name} / ${product.price}원");
    }
  }

  // [2] 장바구니에 상품 담기
  void addToCart() {
    String? inputName = Input.inputMessage("상품 이름을 입력해 주세요!\n");

    var product = productList.firstWhere(
      (p) => p.name == inputName,
      orElse: () => Product(name: '', price: 0),
    );

    if (product.name.isEmpty) {
      print("상품 이름을 제대로 입력해 주세요!\n");
      return;
    }

    try {
      String? inputCount = Input.inputMessage("상품 개수를 입력해 주세요!\n");
      int count = int.parse(inputCount ?? '0');

      if (count > 0) {
        cartList.addAll(List.filled(count, product));
        print("장바구니에 상품이 담겼어요!\n");
      } else {
        print("0개보다 많은 개수의 상품만 담을 수 있어요!\n");
      }
    } catch (_) {
      print("입력값이 올바르지 않아요!\n");
    }
  }

  // [3] 장바구니 보기
  void showTotal() {
    if (cartList.isEmpty) {
      print("장바구니에 담긴 상품이 없습니다.\n");
      return;
    }

    cartTotalPrice = cartList.fold(0, (sum, p) => sum + p.price);
    print("장바구니에 ${_cartSummary()}가 담겨있네요. 총 $cartTotalPrice원 입니다!\n");
  }

  // [4] 장바구니 요약
  String _cartSummary() {
    final countMap = <String, int>{};
    for (var p in cartList) {
      countMap[p.name] = (countMap[p.name] ?? 0) + 1;
    }

    return countMap.entries.map((e) => "${e.key} ${e.value}개").join(", ");
  }

  // [5] 종료
  bool endFun() {
    var input = Input.inputMessage("정말 종료하시겠습니까? 종료를 원하시면 '5'를 입력해주세요\n");
    if (input == '5') {
      print("이용해 주셔서 감사합니다~ 안녕히 가세요!");
      return true;
    }
    print("종료하지 않습니다.");
    return false;
  }

  // [6] 장바구니 초기화
  void resetCart() {
    if (cartList.isEmpty) {
      print("이미 장바구니가 비어있습니다\n");
    } else {
      cartList.clear();
      print("장바구니를 비웠습니다!\n");
    }
  }
}
