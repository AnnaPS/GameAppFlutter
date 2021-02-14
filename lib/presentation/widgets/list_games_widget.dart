import 'package:flutter/material.dart';
import 'package:game_app/data/models/game_entity.dart';

class ListGamesWidget extends StatelessWidget {
  ListGamesWidget(this._gameList);

  final List<Game> _gameList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
      child: _gameList != null && _gameList.isNotEmpty
          ? Center(
              child: Container(
                height: 600,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _gameList.length,
                    itemBuilder: (context, index) {
                      var game = _gameList[index];
                      return Container(
                        width: 350,
                        child: Card(
                            clipBehavior: Clip.hardEdge,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 8,
                            shadowColor: Colors.blueGrey,
                            margin: EdgeInsets.all(16),
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(game.image),
                                      fit: BoxFit.fill)),
                            )),
                      );
                    }),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
