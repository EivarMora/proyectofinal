import 'package:flutter/material.dart';
import 'package:proyectofinal/ServiceImpl/Validation.dart';
import 'package:proyectofinal/objects/Level.dart';
import 'package:proyectofinal/pages/level.dart';


class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder(
        future: Validation().allLevels(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final levels = snapshot.data as List<Level?>;
            final filteredLevels = levels.where((level) => level != null).toList();
            final sortedLevels = filteredLevels..sort(compareLevels);
            return ListView(
              children: sortedLevels.map((level) => LevelWidget(
                idlevel: level!.level,
                icon: Icons.person,
                title: level.title,
                subtitle: level.subtitle,
              )).toList(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

int compareLevels(Level? a, Level? b) {
  if (a == null || b == null) {
    return (a == null) ? -1 : 1;
  } else {
    return a.level.compareTo(b.level);
  }
}

