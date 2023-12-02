import 'package:flutter/material.dart';
import 'package:pedilo_ya/page_carrito.dart';
import 'package:pedilo_ya/page_menu.dart';
import 'package:pedilo_ya/provider.dart';
import 'package:pedilo_ya/rutas_app.dart';
import 'package:provider/provider.dart';

class PaginaComidaEdit extends StatefulWidget {
  const PaginaComidaEdit({super.key});

  @override
  State<PaginaComidaEdit> createState() => _PaginaComidaEditState();
}

class _PaginaComidaEditState extends State<PaginaComidaEdit> {
  int cantidad = 1;
  int precioFinalCOmida = 0;
  int precioOriginal = 0;

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
          precioFinalCOmida = price * cantidad;
        case "v-":
          precioFinalCOmida = price;
          precioFinalCOmida = precioFinalCOmida * cantidad;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return Scaffold(
          body: Center(
            child: Container(
              width: 800,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    width: 750,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        datosProvider.devolverComidaAEditar()[2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    datosProvider.devolverComidaAEditar()[0],
                    style: const TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 750,
                    height: 100,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 15,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Cantidad:', style: TextStyle(fontSize: 30)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      surfaceTintColor: Colors.transparent),
                                  onPressed: () {
                                    setState(() {
                                      _botonesCantidad(
                                        'v+',
                                        datosProvider
                                            .devolverComidaAEditar()[1],
                                      );
                                    });
                                  },
                                  child: const Icon(
                                    Icons.keyboard_arrow_up_rounded,
                                    color: Colors.black,
                                  )),
                            ),
                            Text(
                              'x$cantidad',
                              style: const TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.transparent,
                                    backgroundColor: Colors.transparent,
                                    surfaceTintColor: Colors.transparent),
                                onPressed: () {
                                  _botonesCantidad(
                                    'v-',
                                    datosProvider.devolverComidaAEditar()[1],
                                  );
                                },
                                child: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 750,
                    height: 100,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 15,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('TOTAL:', style: TextStyle(fontSize: 30)),
                        precioFinalCOmida == 0
                            ? Text(
                                '\$${datosProvider.devolverComidaAEditar()[1]}',
                                style: const TextStyle(fontSize: 30))
                            : Text('\$$precioFinalCOmida',
                                style: const TextStyle(fontSize: 30)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 750,
                    height: 100,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 15,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (datosProvider.devovlerPosicion() ==
                                      'favorito') {
                                    ruta.goNamed(Pages.favorito.name);
                                  } else if (datosProvider.devovlerPosicion() ==
                                      'menu') {
                                    ruta.goNamed(Pages.menu.name);
                                  }
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                )),
                            const Text('Cancelar')
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (precioFinalCOmida == 0) {
                                    precioFinalCOmida = datosProvider
                                        .devolverComidaAEditar()[1];
                                    datosProvider.agregarComidaALaLista(
                                        datosProvider
                                            .devolverComidaAEditar()[0],
                                        datosProvider
                                            .devolverComidaAEditar()[1],
                                        cantidad);
                                  } else {
                                    datosProvider.agregarComidaALaLista(
                                        datosProvider
                                            .devolverComidaAEditar()[0],
                                        precioFinalCOmida,
                                        cantidad);
                                  }

                                  setState(() {
                                    datosProvider.cantidadComidaEnELCArrito();
                                  });
                                  if (datosProvider.listaCarrito().length > 1) {
                                    datosProvider.organizarComidaCarrito();
                                  }
                                  if (datosProvider.devovlerPosicion() ==
                                      'favorito') {
                                    ruta.goNamed(Pages.favorito.name);
                                  } else if (datosProvider.devovlerPosicion() ==
                                      'menu') {
                                    ruta.goNamed(Pages.menu.name);
                                  }
                                },
                                icon: const Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.black,
                                )),
                            const Text('Añadir al carrito')
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (precioFinalCOmida == 0) {
                                    precioFinalCOmida = datosProvider
                                        .devolverComidaAEditar()[1];
                                    datosProvider.agregarComidaALaLista(
                                        datosProvider
                                            .devolverComidaAEditar()[0],
                                        precioFinalCOmida,
                                        cantidad);
                                  } else {
                                    datosProvider.agregarComidaALaLista(
                                        datosProvider
                                            .devolverComidaAEditar()[0],
                                        precioFinalCOmida,
                                        cantidad);
                                  }
                                  if (datosProvider.listaCarrito().length > 1) {
                                    datosProvider.organizarComidaCarrito();
                                  }
                                  setState(() {
                                    datosProvider.cantidadComidaEnELCArrito();
                                  });
                                  ruta.goNamed(Pages.carrito.name);
                                },
                                icon: const Icon(
                                  Icons.check,
                                  color: Colors.black,
                                )),
                            const Text('Comprar')
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
