import 'package:game_app/data/firestore_service/game_service/firestore_service.dart';
import 'package:game_app/data/repository/GamesRepository.dart';
import 'package:game_app/data/repository/gamesRepositoryImpl.dart';
import 'package:game_app/domain/get_games_uc.dart';
import 'package:get_it/get_it.dart';
import 'package:game_app/presentation/providers/game_provider.dart';

final _injector = GetIt.instance;

void setUp() {
  _injector.registerLazySingleton<FirestoreService>(() => FirestoreService());
  _injector.registerLazySingleton<GamesRepository>(
      () => GamesRepositoryImpl(_injector<FirestoreService>()));

  // Providers
  _injector.registerLazySingleton<GameProvider>(
      () => GameProvider(_injector<GetGameUC>()));

  // Use Cases
  _injector.registerLazySingleton<GetGameUC>(
      () => GetGameUC(_injector<GamesRepository>()));
}
