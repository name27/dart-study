import 'dart:io';
import 'model/product.dart';
import 'model/shoppingMall.dart';
import 'util/utils.dart';

void main() {
  ShoppingMall shoppingMall = ShoppingMall(
    productList: [],
    cartList: [],
    cartTotalPrice: 0,
  );
  for (var d in Data.data) {
    shoppingMall.productList.add(Product.fromMap(d));
  }
  var isEnd = false;
  while (!isEnd) {
    switch (Input.inputMessage(null)) {
      case '1': //[1] 상품 목록 보기
        shoppingMall.showProducts();
        break;
      case '2': //[2] 장바구니에 담기
        shoppingMall.addToCart(shoppingMall.productList);
        break;
      case '3': //[3] 장바구니 담긴 상품 총 가격 보기
        shoppingMall.showTotal(shoppingMall.cartList);
        break;
      case '4': //[4] 프로그램 종료
        isEnd = shoppingMall.endFun();
        break;
      case '6': //[6] 장바구니초기화
        shoppingMall.resetCart(shoppingMall.cartList);
        break;
      case '0': //[0] 장바구니 목록 보기
        shoppingMall.showCartList(shoppingMall.cartList);
        break;
      default:
        print("지원하지 않는 기능입니다! 다시 시도해주세요..");
    }
  }
}
