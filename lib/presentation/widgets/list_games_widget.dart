import 'package:flutter/material.dart';
import 'package:game_app/data/models/game_entity.dart';
import 'package:game_app/presentation/widgets/game_item.dart';

class ListGamesWidget extends StatelessWidget {
  const ListGamesWidget(this._gameList);
  final List<Game> _gameList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
      child: _gameList != null && _gameList.isNotEmpty
          ? Center(
              child: Container(
                height: MediaQuery.of(context).size.height * .75,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _gameList.length,
                  itemBuilder: (context, index) {
                    return GameItem(_gameList[index]);
                  },
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
