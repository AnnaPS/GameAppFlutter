import 'package:flutter/material.dart';
import 'package:game_app/data/models/game_entity.dart';

class ListGameWidget extends StatelessWidget {
  ListGameWidget(this._gameList, this._title);

  final List<Game> _gameList;
  final String _title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
      child: _gameList != null && _gameList.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _gameList.length,
                      itemBuilder: (context, index) {
                        var game = _gameList[index];
                        return Container(
                          height: 150,
                          width: 200,
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 8,
                            shadowColor: Colors.blueGrey,
                            margin: EdgeInsets.all(16),
                            child: Stack(
                              children: [
                                Container(
                                  height: 150,
                                  child: Image(
                                    image: NetworkImage(game.image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Container(
                                    height: 35,
                                    color: Colors.black87,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        game.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
