import 'package:flutter/material.dart';
import 'package:proyectofinal/pages/palabar.dart';


class LevelWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final int idlevel;

  const LevelWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.idlevel
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Palabra(nivel: this.idlevel),
      ),
    ),
      mouseCursor: MouseCursor.defer,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 24.0)),
                  Text(subtitle, style: const TextStyle(fontSize: 16.0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

