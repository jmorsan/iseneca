import 'dart:convert';

class User {
  User({
    required this.id,
    required this.usuario,
    required this.clave,
  });

  String id;
  String usuario;
  String clave;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        usuario: json["usuario"],
        clave: json["clave"],
      );
}
