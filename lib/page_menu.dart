import "package:flutter/material.dart";
import 'package:pedilo_ya/cartelito.dart';
import 'package:pedilo_ya/provider.dart';
import 'package:pedilo_ya/rutas_app.dart';
import 'package:provider/provider.dart';

class PaginaMenu extends StatefulWidget {
  const PaginaMenu({super.key});

  @override
  State<PaginaMenu> createState() => _PaginaMenuState();
}

class _PaginaMenuState extends State<PaginaMenu> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      ruta.goNamed(Pages.carrito.name);
                    },
                    icon: const Icon(Icons.shopping_cart_rounded),
                    iconSize: 50,
                  ),
                  datosProvider.cantidadComidaEnELCArrito() != 0
                      ? Positioned(
                          top: 2.0,
                          right: 30.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 10.0,
                            child: Text(
                              "${datosProvider.cantidadComidaEnELCArrito()}",
                              style: const TextStyle(
                                  fontSize: 10.0, color: Colors.white),
                            ),
                          ),
                        )
                      : Container(),
                ],
              )
            ],
            title: const Center(
              child: Text('Menu'),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 500,
                  height: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        _mostrarDialog(context, 'Pizza Napolitana', 2300,
                            datosProvider.imagenMostrar('pizza_napo'));
                      },
                      child: const Text('Pizza')),
                ),
                SizedBox(
                  width: 500,
                  height: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        _mostrarDialog(context, 'Pancho', 2200,
                            datosProvider.imagenMostrar('pancho'));
                      },
                      child: const Text('Pancho')),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  child: TextButton(
                    onPressed: () {
                      datosProvider.mostrarListaPedido();
                    },
                    child: const Text('Aceptar'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _mostrarDialog(
      BuildContext context, String name, double price, String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Cartelito(name: name, price: price, image: image);
      },
    );
  }
}
