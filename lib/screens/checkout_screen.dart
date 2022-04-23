import 'package:ecommerce_mechanical_keyboard/constants.dart';
import 'package:ecommerce_mechanical_keyboard/models/cart.dart';
import 'package:ecommerce_mechanical_keyboard/models/user.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  final double total;
  const CheckoutScreen({required this.total, Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: kDefaultPadding),
              child: Align(
                child: SizedBox(
                  height: 55,
                  width: 55,
                  child: Card(
                    color: kPrimaryColor,
                    shadowColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 3,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: kTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kDefaultPadding / 2),
                  const Text(
                    "Checkout",
                    style: TextStyle(
                        color: kTextLightColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kPrimaryColor.withOpacity(0.3),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: kDefaultPadding / 2),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          child: Text(
                            "Order summary",
                            style: TextStyle(
                              color: kTextLightColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
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
                                      Padding(
                                        padding: const EdgeInsets.all(
                                            kDefaultPadding / 2),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                // width: double.infinity,
                                                height: 100,
                                                width: 100,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    image: DecorationImage(
                                                      image: AssetImage(cartItem
                                                          .product.image),
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                                height: kDefaultPadding),
                                            const SizedBox(
                                                width: kDefaultPadding / 4),
                                            SizedBox(
                                              width: size.width * 0.5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${cartItem.quantity.toInt()}x - ${cartItem.product.title}",
                                                    overflow: TextOverflow.clip,
                                                    style: const TextStyle(
                                                        color: kTextLightColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  const SizedBox(
                                                      height:
                                                          kDefaultPadding / 4),
                                                  Text(
                                                    cartItem
                                                        .product.description,
                                                    overflow: TextOverflow.clip,
                                                    style: const TextStyle(
                                                        color: kTextLightColor,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  const SizedBox(
                                                      height:
                                                          kDefaultPadding / 4),
                                                  Text(
                                                    "\$${cartItem.product.price * cartItem.quantity}",
                                                    style: const TextStyle(
                                                        color: kPrimaryColor,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                      width: size.width * 0.02),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(
                                      thickness: 1,
                                      color: kTextLightColor.withOpacity(0.2),
                                    ),
                                  ),
                                ],
                              );
                            }),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          child: Text(
                            "Total: \$${widget.total}",
                            style: const TextStyle(
                              color: kTextLightColor,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        const SizedBox(height: kDefaultPadding),
                      ],
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kPrimaryColor.withOpacity(0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: kDefaultPadding / 2),
                          const Text(
                            "Billing details",
                            style: TextStyle(
                              color: kTextLightColor,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: kDefaultPadding),
                          Text(
                            users[0].name,
                            style: const TextStyle(
                              color: kTextLightColor,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: kDefaultPadding / 4),
                          Text(
                            users[0].email,
                            style: const TextStyle(
                              color: kTextLightColor,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: kDefaultPadding / 4),
                          Text(
                            users[0].phone,
                            style: const TextStyle(
                              color: kTextLightColor,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: kDefaultPadding / 4),
                          Text(
                            users[0].address,
                            style: const TextStyle(
                              color: kTextLightColor,
                              fontSize: 16,
                            ),
                          ),
                         
                          const SizedBox(height: kDefaultPadding),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
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
                                  "Checkout",
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
