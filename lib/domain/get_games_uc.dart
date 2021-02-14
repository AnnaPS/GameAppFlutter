import 'package:game_app/data/models/game_entity.dart';
import 'package:game_app/data/repository/GamesRepository.dart';

class GetGameUC {
  const GetGameUC(this._gamesRepository) : assert(_gamesRepository != null);
  final GamesRepository _gamesRepository;

  Future<List<Game>> call(String collectionName) async {
    final _games = await _gamesRepository.getGamesCollection(collectionName);
    return _games;
  }
}
