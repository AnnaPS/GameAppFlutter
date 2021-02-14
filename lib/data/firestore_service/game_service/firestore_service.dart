import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:game_app/data/models/game_entity.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Game>> getGamesByCollection(String collectionName) async {
    final _games = <Game>[];
    await _db.collection(collectionName).get().then(
      (querySnapshot) {
        for (final element in querySnapshot.docs) {
          _games.add(Game.fromMap(element.data()));
        }
      },
    );
    return _games;
  }
}
