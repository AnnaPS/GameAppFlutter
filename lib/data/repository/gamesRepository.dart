import 'package:game_app/data/models/game_entity.dart';

abstract class GamesRepository {
  Future<List<Game>> getGamesCollection(String collectionName);
}
