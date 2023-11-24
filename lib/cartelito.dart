import "package:flutter/material.dart";
import "package:pedilo_ya/provider.dart";
import "package:provider/provider.dart";

class Cartelito extends StatefulWidget {
  const Cartelito(
      {super.key,
      required this.name,
      required this.price,
      required this.image});
  final String name;
  final double price;
  final String image;

  @override
  State<Cartelito> createState() => _CartelitoState();
}

class _CartelitoState extends State<Cartelito> {
  int cantidad = 1;
  //bool cantidadIgualAUno = false;
  double precioFinalCOmida = 0;

  void _botonesCantidad(String decision, double price) {
    setState(() {
      switch (decision) {
        case 'v+':
          cantidad++;
          _calcularTotalCantidad(price, cantidad, decision);
        case 'v-':
          cantidad--;
          if (cantidad < 1) {
            cantidad = 1;
          }
          _calcularTotalCantidad(price, cantidad, decision);
      }
    });
  }

  void _calcularTotalCantidad(double price, int cantidad, String decision) {
    setState(() {
      switch (decision) {
        case "v+":
          precioFinalCOmida = widget.price * cantidad;
        case "v-":
          precioFinalCOmida = widget.price;
          precioFinalCOmida = widget.price * cantidad;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return AlertDialog(
          content: SizedBox(
            width: 500,
            height: 500,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    child: Image.asset(widget.image, height: 250),
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Cantidad:', style: TextStyle(fontSize: 30)),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                _botonesCantidad('v+', widget.price);
                              },
                              icon:
                                  const Icon(Icons.keyboard_arrow_up_rounded)),
                          Text(
                            'x$cantidad',
                            style: const TextStyle(fontSize: 30),
                          ),
                          IconButton(
                            onPressed: () {
                              _botonesCantidad('v-', widget.price);
                            },
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  precioFinalCOmida == 0
                      ? Text('\$${widget.price}',
                          style: const TextStyle(fontSize: 30))
                      : Text('\$$precioFinalCOmida',
                          style: const TextStyle(fontSize: 30)),
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
                      if (precioFinalCOmida == 0) {
                        precioFinalCOmida = widget.price;
                        datosProvider.agregarComidaALaLista(
                            widget.name, precioFinalCOmida, cantidad);
                      } else {
                        datosProvider.agregarComidaALaLista(
                            widget.name, precioFinalCOmida, cantidad);
                      }
                      setState(() {
                        datosProvider.cantidadComidaEnELCArrito();
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
