import 'package:flutter/material.dart';
import 'package:proyectofinal/imports/Widgets.dart';
import 'package:proyectofinal/ServiceImpl/Validation.dart';

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
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.visibility_off),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 48.0,
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  if (_usernameController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    validateUser(context, _usernameController.text, _passwordController.text );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Debe completar todos los campos'),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
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
