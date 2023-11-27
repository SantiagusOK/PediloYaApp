import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:pedilo_ya/provider.dart";
import "package:pedilo_ya/rutas_app.dart";
import "package:provider/provider.dart";

class CartelDireccion extends StatefulWidget {
  const CartelDireccion({super.key});

  @override
  State<CartelDireccion> createState() => _CartelDireccionState();
}

class _CartelDireccionState extends State<CartelDireccion> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Tipo de Pago',
              style: TextStyle(fontSize: 30),
            ),
          ),
          content: const SizedBox(
            width: 500,
            height: 500,
            child: Center(
              child: TextField(),
            ),
          ),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancelar')),
                  TextButton(
                      onPressed: () {
                        ruta.goNamed(Pages.resultado.name);
                      },
                      child: const Text('Aceptar'))
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
