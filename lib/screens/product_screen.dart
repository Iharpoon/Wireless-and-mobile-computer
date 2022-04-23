import 'package:ecommerce_mechanical_keyboard/constants.dart';
import 'package:ecommerce_mechanical_keyboard/models/option.dart';
import 'package:ecommerce_mechanical_keyboard/models/product.dart';
import 'package:ecommerce_mechanical_keyboard/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductScreen extends StatefulWidget {
  final int id;
  const ProductScreen(this.id, {Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Product product;
  double quantity = 1;
  int selectedOption = 0;

  @override
  void initState() {
    super.initState();
    product = products.where((element) => element.id == widget.id).toList()[0];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: kDefaultPadding),
            child: Align(
              child: SizedBox(
                height: 55,
                width: size.width * 0.30,
                child: Card(
                    color: kPrimaryColor,
                    shadowColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 3,
                    child: Center(
                      child: Text(
                        "\$${product.price * quantity}",
                        style: const TextStyle(
                            color: kBackgroundColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kDefaultPadding / 2),
                  Text(
                    product.title,
                    style: const TextStyle(
                        color: kTextLightColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
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
                    height: 250,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(product.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  RatingBar(
                    initialRating: product.rating,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 30,
                    ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star_rounded,
                        color: kPrimaryColor,
                      ),
                      half: const Icon(
                        Icons.star_half_rounded,
                        color: kPrimaryColor,
                      ),
                      empty: const Icon(
                        Icons.star_outline_rounded,
                        color: kPrimaryColor,
                      ),
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const SizedBox(height: kDefaultPadding),
                  SizedBox(
                    width: size.width * 0.8,
                    child: Text(
                      product.description,
                      style: const TextStyle(
                        color: kTextLightColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  const Text(
                    "Customize",
                    style: TextStyle(
                        color: kTextLightColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final attribute = options[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOption = index;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: selectedOption == index
                                        ? kPrimaryColor.withOpacity(0.6)
                                        : kPrimaryColor.withOpacity(0.1)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(kDefaultPadding),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: AssetImage(attribute.image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(attribute.name,
                                              style: const TextStyle(
                                                  color: kTextLightColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                      Text(attribute.description,
                                          style: const TextStyle(
                                            color: kTextLightColor,
                                            fontSize: 16,
                                          )),
                                      const SizedBox(height: kDefaultPadding),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: kDefaultPadding / 2),
                            ],
                          ),
                        );
                      }),
                  const SizedBox(height: 120),
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
                            GestureDetector(
                              onTap: () => setState(() {
                                quantity > 1 ? quantity-- : quantity = 1;
                              }),
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black.withOpacity(0.3),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: kTextLightColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${quantity.toInt()}",
                              style: const TextStyle(
                                  color: kBackgroundColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () => setState(() {
                                quantity < 999 ? quantity++ : quantity = 999;
                              }),
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black.withOpacity(0.3),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: kTextLightColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (() => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const CartScreen()))),
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
                                "Add to cart",
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
    );
  }
}
