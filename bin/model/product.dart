class Product {
  String name;
  int price;

  Product({required this.name, required this.price});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(name: map['name'], price: map['price']);
  }

  @override
  String toString() {
    return 'Product(name: $name, price: $price)';
  }
}
