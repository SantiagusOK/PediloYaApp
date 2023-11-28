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
  void _mostrarDialog(
      BuildContext context, String name, double price, String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Cartelito(name: name, price: price, image: image);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            actions: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      ruta.goNamed(Pages.carrito.name);
                    },
                    icon: const Icon(Icons.shopping_cart_rounded),
                    iconSize: 50,
                    color: Colors.white,
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
            leading: IconButton(
              onPressed: () {
                ruta.goNamed(Pages.inicio.name);
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
            ),
            title: const Center(
              child: Text('Menu'),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: datosProvider.listaComida().length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 150,
                                  width: 900,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100))),
                                    onPressed: () {
                                      _mostrarDialog(
                                        context,
                                        '${datosProvider.listaComida()[index]}',
                                        datosProvider.listaPrecio()[index],
                                        datosProvider.listaImagen()[index],
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 300,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.asset(
                                              datosProvider
                                                  .listaImagen()[index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${datosProvider.listaComida()[index]}',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 40),
                                              ),
                                              Text(
                                                '\$${datosProvider.listaPrecio()[index]}',
                                                style: const TextStyle(
                                                    color: Colors.yellow,
                                                    fontSize: 40),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
