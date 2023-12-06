import 'package:flutter/material.dart';
import 'package:proyectofinal/imports/Widgets.dart';
import 'package:proyectofinal/reproductor/SounLevel.dart';


class Palabra extends StatefulWidget {
  final int nivel;

  const Palabra({Key? key, required this.nivel}) : super(key: key);

  @override
  State<Palabra> createState() => _PalabraState();
}

class _PalabraState extends State<Palabra> {
  final TextEditingController palabra = TextEditingController();
  late List<String> palabras; // Lista que se inicializará según el nivel
  int puntos = 0;
  int i = 0;

  @override
  void initState() {
    super.initState();
    palabras = obtenerPalabrasSegunNivel(widget.nivel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Palabra  puntos: $puntos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: palabra,
                decoration: const InputDecoration(
                  labelText: 'palabra',
                ),
              ),
            ),
            const SizedBox (
              width: double.infinity,
              height: 48.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 48.0,
              child: ElevatedButton(
                child:  Text('Validar'),
                onPressed: () {
                  puntos = validar(palabra.text, palabras[i]);
                  palabra.clear();
                  if (i >= palabras.length) {
                    // Todas las palabras han sido procesadas, mostrar alerta y redirigir a otro widget
                    mostrarAlerta(context, puntos);
                  } else {
                    setState(() {});
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
            )
        ))],
        
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          reproducir(palabras[i]);
        },
        child: const Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void mostrarAlerta(BuildContext context, int puntos) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Fin del juego'),
          content: Text('Total de puntos: $puntos'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeWidget()),
                );
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  int validar(String palabra, String cierta) {
    if (palabra == cierta) {
      puntos += 10; // Sumar puntos en lugar de asignar
    } else {
      puntos += 0;
    }
    i++;
    return puntos;
  }

  List<String> obtenerPalabrasSegunNivel(int nivel) {
    switch (nivel) {
      case 1:
        return ["feo", "tia", "hoy", "ira", "ojo", "oso", "soy", "uno", "uva", "veo"];
      case 2:
        return ["aldea", "banos", "carta", "flauta", "galaxia", "lunares", "mercancia", "particulas", "serpientes", "ultimo"];
      case 3:
        return ["adolescentes", "cucharaditas", "deslumbrador", "diccionario", "espectaculos", "helicopteros", "procesadores", "psiquiatrico", "refrescantes", "reproduccion"];
      // Agrega más casos según sea necesario
      default:
        return [];
    }
  }
}
