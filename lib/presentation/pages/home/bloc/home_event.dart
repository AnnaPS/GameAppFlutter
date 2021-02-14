import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class GetGamesEvent extends HomeEvent {
  const GetGamesEvent(this.dbName);
  final String dbName;
}
