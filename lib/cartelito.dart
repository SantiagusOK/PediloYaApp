import "package:flutter/material.dart";
import "package:pedilo_ya/provider.dart";
import "package:pedilo_ya/rutas_app.dart";
import "package:provider/provider.dart";

class Cartelito extends StatefulWidget {
  const Cartelito(
      {super.key,
      required this.name,
      required this.price,
      required this.image});
  final String name;
  final int price;
  final String image;

  @override
  State<Cartelito> createState() => _CartelitoState();
}

class _CartelitoState extends State<Cartelito> {
  int cantidad = 1;
  int precioFinalCOmida = 0;

  void _botonesCantidad(String decision, int price) {
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

  void _calcularTotalCantidad(int price, int cantidad, String decision) {
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
                    height: 300,
                    width: 400,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Cantidad:', style: TextStyle(fontSize: 30)),
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
                            style: const TextStyle(fontSize: 20),
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
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.cancel),
                    iconSize: 30,
                  ),
                  const SizedBox(width: 100),
                  IconButton(
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
                    icon: const Icon(Icons.add_shopping_cart_rounded),
                    iconSize: 30,
                  ),
                  const SizedBox(width: 100),
                  IconButton(
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
                      ruta.goNamed(Pages.carrito.name);
                    },
                    icon: const Icon(Icons.check),
                    iconSize: 30,
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
