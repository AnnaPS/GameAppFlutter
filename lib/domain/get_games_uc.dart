import 'package:game_app/data/models/game_entity.dart';
import 'package:game_app/data/repository/GamesRepository.dart';

class GetGameUC {
  final GamesRepository _gamesRepository;

  GetGameUC(this._gamesRepository) : assert(_gamesRepository != null);

  Future<List<Game>> call(String collectionName) async {
    var games = await _gamesRepository.getGamesCollection(collectionName);
    return games;
  }
}
