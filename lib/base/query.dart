import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectofinal/objects/Level.dart';
import 'package:proyectofinal/objects/Usuario.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<Usuario?> getUserByName(String name) async {
  try {
    final query = db.collection('users').where('name', isEqualTo: name);
    final results = await query.get();
    if (results.docs.isEmpty) {
      return null; // Return null if no user found
    }

    final userDoc = results.docs.first;
    final user = Usuario(
      name: userDoc['name'],
      password: userDoc['password'],
      level: userDoc['level'],
    );

    return user;
  } catch (e) {
    // Handle any errors here
    print('Error fetching user: $e');
    return null;
  }
}


Future<List<Level?>> getAllLevels() async {
  try {
    final query = db.collection('levels');
    final results = await Future.value(query.get()); // Wrap get() in Future

    if (results.docs.isEmpty) {
      return <Level?>[];
    }

    final levels = <Level?>[];
    for (final doc in results.docs) {
      final levelID = doc['level'];
      final levelPoints = doc['points'];
      final levelTitle = doc['title'];
      final levelSubtitle = doc['subtitle'];

      final level = Level(
        level: levelID,
        points: levelPoints,
        title: levelTitle,
        subtitle: levelSubtitle
      );

      levels.add(level);
    }

    return levels;
  } catch (e) {
    // Handle any errors here
    print('Error al obtener niveles: $e');
    return <Level?>[];
  }
}
