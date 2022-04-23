import 'package:ecommerce_mechanical_keyboard/constants.dart';
import 'package:ecommerce_mechanical_keyboard/models/cart.dart';
import 'package:ecommerce_mechanical_keyboard/models/product.dart';
import 'package:ecommerce_mechanical_keyboard/screens/checkout_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Product product;
  int quantity = 1;
  int selectedOption = 0;
  double totalPrice = 0.0;

  _updateCartPrice() {
    totalPrice = 0;
    for (var carItem in cartItems) {
      totalPrice += (carItem.product.price * carItem.quantity);
    }
    setState(() {
      totalPrice;
    });
  }

  @override
  void initState() {
    super.initState();
    _updateCartPrice();
    // product = products.where((element) => element.id == widget.id).toList()[0];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "My Cart",
                      style: TextStyle(
                          color: kTextLightColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cartItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          final cartItem = cartItems[index];
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: kPrimaryColor.withOpacity(0.2),
                                    ),
                                    height: size.height * 0.4,
                                    width: double.infinity,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        kDefaultPadding / 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: kPrimaryColor,
                                                spreadRadius: 0,
                                                blurRadius: 15.0,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          width: double.infinity,
                                          height: 180,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    cartItem.product.image),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: kDefaultPadding),
                                        Text(
                                          "\$${cartItem.product.price * cartItem.quantity}",
                                          style: const TextStyle(
                                              color: kPrimaryColor,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                            height: kDefaultPadding / 4),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: size.width * 0.48,
                                              child: Text(
                                                cartItem.product.title,
                                                overflow: TextOverflow.clip,
                                                style: const TextStyle(
                                                    color: kTextLightColor,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            SizedBox(width: size.width * 0.02),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: kPrimaryColor,
                                              ),
                                              height: 50,
                                              width: size.width * 0.35,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () => setState(() {
                                                        cartItem.quantity > 1
                                                            ? cartItem
                                                                .quantity--
                                                            : cartItem
                                                                .quantity = 1;
                                                        _updateCartPrice();
                                                      }),
                                                      child: Container(
                                                        width: 35,
                                                        height: 35,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.black
                                                              .withOpacity(0.3),
                                                        ),
                                                        child: const Icon(
                                                          Icons.remove,
                                                          color:
                                                              kTextLightColor,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      "${cartItem.quantity.toInt()}",
                                                      style: const TextStyle(
                                                          color:
                                                              kBackgroundColor,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    GestureDetector(
                                                      onTap: () => setState(() {
                                                        cartItem.quantity < 999
                                                            ? cartItem
                                                                .quantity++
                                                            : cartItem
                                                                .quantity = 999;
                                                        _updateCartPrice();
                                                      }),
                                                      child: Container(
                                                        width: 35,
                                                        height: 35,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.black
                                                              .withOpacity(0.3),
                                                        ),
                                                        child: const Icon(
                                                          Icons.add,
                                                          color:
                                                              kTextLightColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: kDefaultPadding),
                            ],
                          );
                        }),
                    const SizedBox(height: kDefaultPadding * 5),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kPrimaryColor,
                        ),
                        height: 65,
                        width: size.width * 0.38,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 5),
                              Text(
                                "\$$totalPrice",
                                style: const TextStyle(
                                    color: kBackgroundColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (() =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CheckoutScreen(
                                      total: totalPrice,
                                    )))),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kTextLightColor,
                          ),
                          height: 65,
                          width: size.width * 0.48,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Place order",
                                  style: TextStyle(
                                      color: kBackgroundColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: kBackgroundColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
