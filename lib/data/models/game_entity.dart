import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

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

  factory Game.fromMap(Map<String, dynamic> json) => Game(
        name: json['name'],
        price: json['price'],
        rate: json['rate'],
        shortDesc: json['short_desc'],
        longDesc: json['long_desc'],
        gameImage: json['game_image'],
        image: json['image'],
      );
  factory Game.fromFirestore(DocumentSnapshot documentSnapshot) {
    final _game = Game.fromMap(documentSnapshot.data());
    return _game;
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'price': price,
        'rate': rate,
        'short_desc': shortDesc,
        'long_desc': longDesc,
        'game_image': gameImage,
        'image': image,
      };

  String name;
  String price;
  String rate;
  String shortDesc;
  String longDesc;
  String gameImage;
  String image;
}
