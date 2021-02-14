import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/presentation/pages/home/bloc/home_event.dart';
import 'package:game_app/presentation/pages/home/bloc/home_state.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/get_games_uc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState);
  @override
  Stream<HomeState> mapEventToState(event) async* {
    if (event is GetGamesEvent) {
      yield* _mapGetGamesToState(event);
    }
  }

  Stream<HomeState> _mapGetGamesToState(GetGamesEvent event) async* {
    try {
      yield GetGamesInProgress();
      final games = await GetIt.I<GetGameUC>().call(event.dbName);
      yield GetGamesSuccess(games);
    } catch (e) {
      yield GetGamesFailure(e.toString());
    }
  }
}
