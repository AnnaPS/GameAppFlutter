import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:game_app/data/models/game_entity.dart';

class FirestoreService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Game>> getGamesByCollection(String collectionName) async {
    var games = <Game>[];
    await db.collection(collectionName).get().then(
          (querySnapshot) => querySnapshot.docs.forEach(
            (element) {
              games.add(
                Game.fromMap(element.data()),
              );
            },
          ),
        );
    return games;
  }
}
