import 'package:ecommerce_mechanical_keyboard/constants.dart';
import 'package:ecommerce_mechanical_keyboard/models/product.dart';
import 'package:ecommerce_mechanical_keyboard/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = products[index];
            return Padding(
              padding: EdgeInsets.fromLTRB(
                kDefaultPadding,
                index == 0 ? kDefaultPadding : 0,
                kDefaultPadding,
                kDefaultPadding,
              ),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => ProductScreen(product.id)))),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kTextLightColor,
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
                  height: 280,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(product.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shadowColor: kPrimaryColor,
                                color: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 3,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        product.favorite
                                            ? product.favorite = false
                                            : product.favorite = true;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: product.favorite
                                          ? Colors.red
                                          : kTextLightColor,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: kDefaultPadding,
                          left: kDefaultPadding / 2,
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  width: 280,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: kBackgroundColor.withOpacity(0.5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.title,
                                          style: const TextStyle(
                                              color: kTextLightColor,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 2),
                                        RatingBar(
                                          initialRating: product.rating,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 15,
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
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
