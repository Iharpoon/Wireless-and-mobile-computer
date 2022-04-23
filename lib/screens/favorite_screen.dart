import 'package:ecommerce_mechanical_keyboard/constants.dart';
import 'package:ecommerce_mechanical_keyboard/models/product.dart';
import 'package:ecommerce_mechanical_keyboard/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

final favoriteProducts = products.where((element) => element.favorite).toList();

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(favoriteProducts.length, (index) {
        final product = favoriteProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductScreen(product.id)));
          },
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: index % 2 == 0
                      ? const EdgeInsets.fromLTRB(
                          kDefaultPadding,
                          kDefaultPadding / 2,
                          kDefaultPadding / 2,
                          kDefaultPadding / 2)
                      : const EdgeInsets.fromLTRB(
                          kDefaultPadding / 2,
                          kDefaultPadding / 2,
                          kDefaultPadding,
                          kDefaultPadding / 2),
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
                                      onPressed: () {},
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
                            bottom: kDefaultPadding / 2,
                            left: kDefaultPadding / 2,
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 140,
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
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 2),
                                        RatingBar(
                                          initialRating: product.rating,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 12,
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
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: kDefaultPadding / 2,
              ),
            ],
          ),
        );
      }),
    );
  }
}
