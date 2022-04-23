class User {
  int id;
  String email, password, name, address, phone;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });
}

List<User> users = [
  User(
    id: 1,
    email: 'teste@gmail.com',
    password: '123456',
    name: 'Esther Sara Vieira',
    address: '1518 Stellar Dr, Kenai, Alaska 99611, USA',
    phone: '+15853042351 ',
  ),
];
