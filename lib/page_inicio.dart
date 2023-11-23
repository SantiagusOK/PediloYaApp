import "package:flutter/material.dart";
import "package:pedilo_ya/rutas_app.dart";

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  ruta.goNamed(Pages.menu.name);
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
