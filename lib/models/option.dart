class Option {
  final String image, name, description;
  final int id;

  bool required;

  Option({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.required,
  });
}

List<Option> options = [
  Option(
    id: 1,
    image: "assets/images/switch_blue.png",
    name: "Switches",
    description: 'Blue - Optical',
    required: false,
  ),
  Option(
    id: 2,
    image: "assets/images/switch_red.png",
    name: "Switches",
    description: 'Red - Optical',
    required: false,
  ),
];
