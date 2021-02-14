import 'package:game_app/data/firestore_service/game_service/firestore_service.dart';
import 'package:game_app/data/repository/GamesRepository.dart';
import 'package:game_app/data/repository/gamesRepositoryImpl.dart';
import 'package:game_app/domain/get_games_uc.dart';
import 'package:get_it/get_it.dart';

final _injector = GetIt.instance;

void setUp() {
  _injector
    ..registerLazySingleton<FirestoreService>(() => FirestoreService())
    ..registerLazySingleton<GamesRepository>(
        () => GamesRepositoryImpl(_injector<FirestoreService>()))
    ..registerLazySingleton<GetGameUC>(
      () => GetGameUC(
        _injector<GamesRepository>(),
      ),
    );
}
