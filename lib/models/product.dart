class Product {
  final String image, title, description;
  final int switches, id;
  final double rating, price;
  bool favorite;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.description,
    required this.switches,
    required this.favorite,
  });
}

List<Product> products = [
  Product(
    id: 1,
    image: "assets/images/keyboard_1.png",
    title: "Drop CTRL Mechanical Keyboard",
    price: 200,
    rating: 3.5,
    description:
        "Constructed with a solid aluminum frame with a built-in switch plate, it's stable and fortigiedd.",
    switches: 2,
    favorite: true,
  ),
  Product(
    id: 2,
    image: "assets/images/keyboard_2.png",
    title: "Ducky Creator Mecha Mini Mechanical Keyboard",
    price: 154,
    rating: 5,
    description:
        "Constructed with a solid aluminum frame with a built-in switch plate, it's stable and fortigiedd.",
    switches: 2,
    favorite: false,
  ),
];
