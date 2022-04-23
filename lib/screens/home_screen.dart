import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_mechanical_keyboard/constants.dart';
import 'package:ecommerce_mechanical_keyboard/screens/cart_screen.dart';
import 'package:ecommerce_mechanical_keyboard/screens/components/products_list.dart';
import 'package:ecommerce_mechanical_keyboard/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

int page = 0;
GlobalKey _bottomNavigationKey = GlobalKey();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        color: kSecondaryColor,
        backgroundColor: Colors.transparent,
        items: const [
          Icon(Icons.home, size: 35, color: kPrimaryColor),
          Icon(Icons.favorite, size: 35, color: kPrimaryColor),
          Icon(Icons.shopping_cart, size: 35, color: kPrimaryColor),
          Icon(Icons.person, size: 35, color: kPrimaryColor),
        ],
        onTap: (index) async {
          setState(() {
            page = index;
          });
        },
      ),
      appBar: page == 2
          ? null
          : AppBar(
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
                            onPressed: () {},
                            icon: const Icon(
                              Icons.tune,
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
                Align(
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
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person,
                            color: kTextColor,
                          )),
                    ),
                  ),
                ),
                const SizedBox(width: kDefaultPadding),
              ],
            ),
      body: page == 1
          ? const FavoriteScreen()
          : page == 2
              ? const CartScreen()
              : page == 3
                  ? Container()
                  : Column(
                      children: [
                        const SizedBox(height: kDefaultPadding / 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kSecondaryColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: kPrimaryColor,
                                  spreadRadius: 0,
                                  blurRadius: 5.0,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              style: const TextStyle(color: kTextLightColor),
                              decoration: InputDecoration(
                                hintText: "Search here...",
                                hintStyle: TextStyle(
                                    color: kTextLightColor.withOpacity(0.6)),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Card(
                                    shadowColor: kPrimaryColor,
                                    color: kPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    elevation: 3,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.search_sharp,
                                          color: kTextColor,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const ProductsList(),
                      ],
                    ),
    );
  }
}
