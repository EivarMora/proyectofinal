import 'package:proyectofinal/base/query.dart';
import 'package:proyectofinal/objects/Level.dart';
import 'package:proyectofinal/objects/Usuario.dart';

class Validation{

  Validation();

  Future<bool> userValidation(String name, String password) async {
    bool isValid = false;

    Usuario? user = await getUserByName(name);
    print(user.toString());
    if (user != null) {
      if (user.password == password) {
        isValid = true;
      }
    }

    return isValid;
  }

  Future<List<Level?>> allLevels() async {
    bool isValid = false;
    List<Level?> list = await getAllLevels();
    return list;
  }


}