import 'package:hesap/data/model/product.dart';

class Order {
  Product product;
  int quantity;

  Order({
    required this.product,
    required this.quantity,
  });
}
