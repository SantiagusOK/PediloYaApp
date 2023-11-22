import 'package:flutter/material.dart';
import 'package:pedilo_ya/rutas.dart';

class PageLogin extends StatelessWidget {
  const PageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PaginaLogin(),
    );
  }
}

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({super.key});

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: ElevatedButton(
              onPressed: () {
                router.goNamed(Pages.pageInicio.name);
              },
              /*style:
                      ElevatedButton.styleFrom(fixedSize: const Size(100, 60)),*/
              child: const Row(
                children: [
                  Icon(Icons.arrow_left_outlined),
                  Text('ATRAS'),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'INICIAR SESION',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Correo electronico',
                        border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    router.goNamed(Pages.pageMenu.name);
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(200, 60)),
                  child: const Text('ACEPTAR'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
