// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromJson(jsonString);

import 'dart:convert';

List<UsersResponse> usersResponseFromJson(String str) => List<UsersResponse>.from(json.decode(str).map((x) => UsersResponse.fromJson(x)));

String usersResponseToJson(List<UsersResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersResponse {
    UsersResponse({
        required this.id,
        required this.usuario,
        required this.clave,
    });

    String id;
    String usuario;
    String clave;

    factory UsersResponse.fromJson(Map<String, dynamic> json) => UsersResponse(
        id: json["id"],
        usuario: json["usuario"],
        clave: json["clave"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "clave": clave,
    };
}
