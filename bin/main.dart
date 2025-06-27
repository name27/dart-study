import 'model/product.dart';
import 'model/shopping_mall.dart';
import 'util/utils.dart';
import 'util/admin.dart';

void main() {
  ShoppingMall shoppingMall = ShoppingMall(
    productList: [],
    cartList: [],
    cartTotalPrice: 0,
  );
  Admin admin = Admin();
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
        shoppingMall.addToCart();
        break;
      case '3': //[3] 장바구니 담긴 상품, 갯수. 총 가격 보기
        shoppingMall.showTotal();
        break;
      case '4': //[4] 프로그램 종료
        isEnd = shoppingMall.endFun();
        break;
      case '6': //[6] 장바구니초기화
        shoppingMall.resetCart();
        break;
      //[0] 관리자 모드
      case '0':
        shoppingMall.productList = admin.adminMode(shoppingMall.productList);
        break;
      default:
        print("지원하지 않는 기능입니다! 다시 시도해주세요..");
    }
  }
}
