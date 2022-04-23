import 'package:ecommerce_mechanical_keyboard/models/option.dart';
import 'package:ecommerce_mechanical_keyboard/models/product.dart';

class Cart {
  int userId, id;
  Product product;
  double quantity;
  List<Option> options;

  Cart({
    required this.id,
    required this.product,
    required this.quantity,
    required this.options,
    required this.userId,
  });
}

List<Cart> cartItems = [
  Cart(
    id: 1,
    product: products[0],
    quantity: 1,
    options: options,
    userId: 1,
  ),
  //   Cart(
  //   id: 2,
  //   product: products[1],
  //   quantity: 1,
  //   options: options,
  //   userId: 1,
  // ),
];
