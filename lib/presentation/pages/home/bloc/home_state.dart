import 'package:equatable/equatable.dart';

import '../../../../data/models/game_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class GetGamesSuccess extends HomeState {
  const GetGamesSuccess(this.games);
  final List<Game> games;
}

class GetGamesFailure extends HomeState {
  const GetGamesFailure(this.error);
  final String error;
}

class GetGamesInProgress extends HomeState {}
