import 'package:game_app/data/firestore_service/game_service/firestore_service.dart';
import 'package:game_app/data/models/game_entity.dart';
import 'package:game_app/data/repository/GamesRepository.dart';

class GamesRepositoryImpl extends GamesRepository {
  GamesRepositoryImpl(this._gameFirestoreService)
      : assert(_gameFirestoreService != null);

  final FirestoreService _gameFirestoreService;

  @override
  Future<List<Game>> getGamesCollection(String collectionName) async {
    final _games =
        await _gameFirestoreService.getGamesByCollection(collectionName);
    return _games;
  }
}
