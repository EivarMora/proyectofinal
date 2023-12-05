class Usuario {
  String name;
  String password;
  String level;

  Usuario({required this.name, required this.password, required this.level});


  @override
  String toString() {
    // TODO: implement toString
    return 'Usuario: name: ${name}, password: ${password}, level: ${level}';
  }
}
