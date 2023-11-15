// File: lib/models/mobil.dart
import 'dart:convert';

class Mobil {
    Mobil({this.id, this.brand, this.model, this.color});

    int? id;
    String? brand;
    String? model;
    String? color;

    factory Mobil.fromJson(Map<String, dynamic> json) => Mobil(
        id: json["id"],
        brand: json["brand"],
        model: json["model"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "model": model,
        "color": color,
    };
}

Mobil mobilFromJson(String str) => Mobil.fromJson(json.decode(str));
String mobilToJson(Mobil data) => json.encode(data.toJson());
