import 'package:flutter/material.dart';
import '../../data/models/game_entity.dart';

class GameItem extends StatelessWidget {
  const GameItem(this.game) : assert(game != null);
  final Game game;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * .85,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(game.image), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
