import 'package:flutter/material.dart';
import 'package:pedilo_ya/rutas.dart';

class PagePantallas extends StatelessWidget {
  const PagePantallas({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PaginaBotones(),
    );
  }
}

class PaginaBotones extends StatefulWidget {
  const PaginaBotones({super.key});

  @override
  State<PaginaBotones> createState() => _PaginaBotonesState();
}

class _PaginaBotonesState extends State<PaginaBotones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Pantalla de botones'),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  router.goNamed(Pages.pageInicio.name);
                },
                child: const Text('Pantalla_Inicial')),
          ],
        ),
      ),
    );
  }
}
