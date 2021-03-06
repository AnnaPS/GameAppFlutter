import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Game gameFromMap(String str) => Game.fromMap(json.decode(str));

String gameToMap(Game data) => json.encode(data.toMap());

class Game {
  Game({
    @required this.name,
    @required this.price,
    @required this.rate,
    @required this.shortDesc,
    @required this.longDesc,
    @required this.gameImage,
    @required this.image,
  });

  String name;
  String price;
  String rate;
  String shortDesc;
  String longDesc;
  String gameImage;
  String image;

  factory Game.fromMap(Map<String, dynamic> json) => Game(
        name: json['name'],
        price: json['price'],
        rate: json['rate'],
        shortDesc: json['short_desc'],
        longDesc: json['long_desc'],
        gameImage: json['game_image'],
        image: json['image'],
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'price': price,
        'rate': rate,
        'short_desc': shortDesc,
        'long_desc': longDesc,
        'game_image': gameImage,
        'image': image,
      };

  factory Game.fromFirestore(DocumentSnapshot documentSnapshot) {
    var game = Game.fromMap(documentSnapshot.data());
    return game;
  }
}
