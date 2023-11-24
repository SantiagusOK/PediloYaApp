import "package:flutter/material.dart";
import "package:pedilo_ya/provider.dart";
import "package:provider/provider.dart";

class CartelDesicion extends StatefulWidget {
  const CartelDesicion({super.key, required this.index});
  final int index;

  @override
  State<CartelDesicion> createState() => _CartelDesicionState();
}

class _CartelDesicionState extends State<CartelDesicion> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return AlertDialog(
          content: const SizedBox(
            width: 500,
            height: 500,
            child: Center(
              child: Column(
                children: [
                  Text('Seguro que quieres elimar esta comida'),
                  Text('del carrito?')
                ],
              ),
            ),
          ),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(fontSize: 30),
                      )),
                  const SizedBox(width: 200),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        datosProvider.eliminarUnaComidaEnLaLista(widget.index);
                        print(widget.index);
                        print(datosProvider.listaDeComida());
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Aceptar',
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
