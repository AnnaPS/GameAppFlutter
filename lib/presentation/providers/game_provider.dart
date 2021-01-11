import 'package:game_app/data/models/game_entity.dart';
import 'package:game_app/domain/get_games_uc.dart';
import 'package:flutter/material.dart';

class GameProvider with ChangeNotifier {
  final GetGameUC _getGameUC;

  GameProvider(this._getGameUC) : assert(_getGameUC != null);

// fields
  List<Game> _gameListPS5;
  List<Game> _gameListXboxSeriesX;
  List<Game> _gameListSwitch;
  List<Game> _gameListTopSalesPC;
  String _errorMessage;

// getters
  List<Game> get gameListPS5 => _gameListPS5;
  List<Game> get gameListXboxSeriesX => _gameListXboxSeriesX;
  List<Game> get gameListSwitch => _gameListSwitch;
  List<Game> get gameListTopSalesPC => _gameListTopSalesPC;
  String get errorMessage => _errorMessage;

  void getGames(String collectionName) async {
    try {
      switch (collectionName) {
        case 'switch':
          _gameListSwitch = await _getGameUC(collectionName);

          break;
        case 'playstation5':
          _gameListPS5 = await _getGameUC(collectionName);
          break;
        case 'xboxseriesx':
          _gameListXboxSeriesX = await _getGameUC(collectionName);
          break;
        case 'topsales':
          _gameListTopSalesPC = await _getGameUC(collectionName);
          break;
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
