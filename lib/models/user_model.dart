class UserModel {
  const UserModel({required this.nick, this.pesel, this.email, this.phone});

  final String nick;
  final String? pesel;
  final String? email;
  final String? phone;
}