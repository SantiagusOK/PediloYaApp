import "package:flutter/material.dart";
import "package:pedilo_ya/provider.dart";
import "package:pedilo_ya/rutas_app.dart";
import "package:provider/provider.dart";

class CartelSeguro extends StatefulWidget {
  const CartelSeguro({super.key});

  @override
  State<CartelSeguro> createState() => _CartelSeguroState();
}

class _CartelSeguroState extends State<CartelSeguro> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return AlertDialog(
          content: const Text(
            '¿Seguro que quieres cerrar sesion?',
            style: TextStyle(fontSize: 30),
          ),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        ruta.goNamed(Pages.goodbye.name);
                        Future.delayed(const Duration(seconds: 3), () {
                          ruta.goNamed(Pages.inicio.name);
                        });
                      },
                      icon: const Icon(Icons.check),
                      label: const Text('Si')),
                  TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                      label: const Text('No')),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
