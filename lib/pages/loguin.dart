import 'package:flutter/material.dart';
import 'package:proyectofinal/imports/Widgets.dart';
import 'package:proyectofinal/ServiceImpl/Validation.dart';
import 'package:proyectofinal/reproductor/SounLevel.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictado de palabras'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 33, 243, 233),
      ),
      body: Center(
        child: Container(
          margin: const  EdgeInsets.symmetric(horizontal: 50),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(3, 37, 37, 35),
              ),
              child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  'Iniciar Sesión',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            username(),
                            const SizedBox(
                              height: 20,
                            ),
                            passwor(),
                            const SizedBox(
                              height: 20,
                            ),
                            botonAcceder()
                            ]
                        )
                        
            )
              )
            )
          ],
        ),),
      )
    );
  }
  Container username() {
    // ignore: avoid_unnecessary_containers
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextFormField(
          //style: const TextStyle(fontSize: 10),
          controller: _usernameController,
          decoration: const InputDecoration(labelText: 'usuario'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Este campo es obligatorio';
            }
            return null;
          },
        ),
      ),
    );
  }
Container passwor() {
    // ignore: avoid_unnecessary_containers
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 1.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextFormField(
            //style: const TextStyle(fontSize: 10),
            obscureText: true,
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Contraseña'),
            validator: (value) {
              // ignore: dead_code
              if (value!.length <= 6) {
                return 'La contraseña debe tener màs de 6 caracteres';
                // ignore: dead_code
                if (value.isEmpty) {
                  return 'Este campo es obligatorio';
                }
              }
              return null;
            },
          ),
        ));
  }
  InkWell botonAcceder() {
    return InkWell(
      onTap: () {
        // Coloca aquí la acción para navegar a otra vista (pantalla)
        validateUser(context, _usernameController.text,_passwordController.text );
      },
      child: Container(
        width: 200,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(65, 150, 125, 1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text(
          'Acceder',
          style: TextStyle(
            //fontSize: 25,
            color: Colors.white, // Color del texto
            fontWeight: FontWeight.bold, // Texto en negrita
            fontFamily: AutofillHints.addressCity,
          ),
        ),
      ),
    );
  }

}

Future<void> validateUser(context, String name, String password) async {
  Validation val = Validation();


  bool isValid = await val.userValidation(name, password);

  if (isValid) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomeWidget(),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Credenciales erroneas...'),
      ),
    );
  }
}
