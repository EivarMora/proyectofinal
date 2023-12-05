class Level {
  int level;
  int points;
  String title;
  String subtitle;

  Level({required this.level, required this.points, required this.title, required this.subtitle});


  @override
  String toString() {
    return 'Level: level: $level, points: $points, title: $title, subtitle: $subtitle';
  }
}
