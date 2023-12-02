import "package:flutter/material.dart";
import "package:pedilo_ya/carte_direccion.dart";
import "package:pedilo_ya/provider.dart";
import "package:pedilo_ya/rutas_app.dart";
import "package:provider/provider.dart";

class CartelDesicion extends StatefulWidget {
  const CartelDesicion({super.key});

  @override
  State<CartelDesicion> createState() => _CartelDesicionState();
}

class _CartelDesicionState extends State<CartelDesicion> {
  void _mostrarCartelDireccion(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CartelDireccion();
      },
    );
  }

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
          content: SizedBox(
            width: 500,
            height: 500,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          ruta.goNamed(Pages.tarjeta.name);
                        },
                        icon: const Icon(Icons.branding_watermark_outlined),
                        iconSize: 200,
                      ),
                      const Text(
                        'Transferencia',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          datosProvider.cambiarTipoDePago('Efectivo');
                          ruta.goNamed(Pages.resultado.name);
                        },
                        icon: const Icon(Icons.attach_money),
                        iconSize: 200,
                      ),
                      const Text(
                        'Efectivo',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.cancel),
                    iconSize: 60,
                  ),
                  const SizedBox(width: 200),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
