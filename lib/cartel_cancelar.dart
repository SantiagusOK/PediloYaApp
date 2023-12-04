import "package:flutter/material.dart";
import "package:pedilo_ya/provider.dart";
import "package:pedilo_ya/rutas_app.dart";
import "package:provider/provider.dart";

class CartelCancelarPedido extends StatefulWidget {
  const CartelCancelarPedido({super.key});

  @override
  State<CartelCancelarPedido> createState() => _CartelCancelarPedidoState();
}

class _CartelCancelarPedidoState extends State<CartelCancelarPedido> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Cancelar Pedido',
              style: TextStyle(fontSize: 30),
            ),
          ),
          content: const SizedBox(
            width: 400,
            height: 100,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿Seguro que quiere cancelar el Pedido?',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'NO',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      datosProvider.borrarPedidos();
                      datosProvider.vaciarListaCarritoSaved();
                      ruta.goNamed(Pages.menu.name);
                    },
                    child: const Text(
                      'SI',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
