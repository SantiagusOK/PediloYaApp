import "package:flutter/material.dart";
import 'package:pedilo_ya/cartel_seguro.dart';
import 'package:pedilo_ya/provider.dart';
import 'package:pedilo_ya/rutas_app.dart';
import 'package:provider/provider.dart';

class PaginaCompras extends StatefulWidget {
  const PaginaCompras({super.key});

  @override
  State<PaginaCompras> createState() => _PaginaComprasState();
}

class _PaginaComprasState extends State<PaginaCompras> {
  bool mostrarComprobante = false;
  int compraSeleccionadaIndex = 0;
  String pediloYaLogo = 'assets/pedilo_logo.png';

  void _mostrarCartelSeguro(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CartelSeguro();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        datosProvider.nombreUserNow(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.home_outlined),
                      SizedBox(width: 20),
                      Text(
                        'Inicio',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    ruta.goNamed(Pages.menu.name);
                  },
                ),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.shopping_cart_outlined),
                      SizedBox(width: 20),
                      Text(
                        'Carrito',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    ruta.goNamed(Pages.carrito.name);
                  },
                ),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.shopping_bag_outlined),
                      SizedBox(width: 20),
                      Text(
                        'Mis Compras',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    ruta.goNamed(Pages.compras.name);
                  },
                ),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.favorite_outline_rounded),
                      SizedBox(width: 20),
                      Text(
                        'Favorito',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    datosProvider.listaFavoritos();
                    ruta.goNamed(Pages.favorito.name);
                  },
                ),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.login_rounded),
                      SizedBox(width: 20),
                      Text(
                        'Salir',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    _mostrarCartelSeguro(context);
                  },
                ),

                /*ListTile(
                  title: const Text('Home'),
                  onTap: () {},
                ),*/
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Center(
              child: SizedBox(
                width: 200,
                height: 30,
                child: Image.asset(pediloYaLogo),
              ),
            ),
          ),
          body: datosProvider.devolverListaMisCompras().isNotEmpty
              ? Center(
                  child: Row(
                    children: [
                      const SizedBox(width: 50),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 500,
                        child: Expanded(
                            child: ListView.separated(
                          itemCount:
                              datosProvider.devolverListaMisCompras().length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 140,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 239, 239, 239),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onPressed: () {
                                  datosProvider.actualizarComida(index);
                                  setState(() {
                                    mostrarComprobante = false;
                                    compraSeleccionadaIndex = index;
                                    mostrarComprobante = true;
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${index + 1}',
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        )),
                      ),
                      const SizedBox(width: 150),
                      mostrarComprobante
                          ? Container(
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    offset: Offset(0, 0), // Shadow position
                                  ),
                                ],
                              ),
                              height: 600,
                              width: 500,
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(pediloYaLogo),
                                        const SizedBox(width: 20),
                                        const Text(
                                          '|',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(width: 20),
                                        const Text(
                                          'COMPROBANTE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    color: Colors.white,
                                    height: 320,
                                    width: 450,
                                    child: ListView.separated(
                                      padding: const EdgeInsets.all(10),
                                      itemCount: datosProvider
                                          .devolverListaCarritoSave()
                                          .length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                                width: 10,
                                                child: Text('${index + 1}')),
                                            SizedBox(
                                                width: 100,
                                                child: Text(datosProvider
                                                        .devolverListaCarritoSave()[
                                                    index][0])),
                                            SizedBox(
                                                width: 20,
                                                child: Text(
                                                    'x${datosProvider.devolverListaCarritoSave()[index][1]}')),
                                            Text(
                                                '\$${datosProvider.devolverListaCarritoSave()[index][2]}')
                                          ],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const Divider(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const SizedBox(width: 50),
                                      const Text('TOTAL:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)),
                                      const SizedBox(width: 10),
                                      Text(
                                          '\$${datosProvider.calcularTotalListaCarritoSave()}',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    color: Colors.white,
                                    height: 150,
                                    width: 450,
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: ListView.separated(
                                            itemCount: datosProvider
                                                .devolverListaComprobanteDatos()
                                                .length,
                                            separatorBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    const Divider(
                                              color: Colors.red,
                                            ),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Row(
                                                children: [
                                                  Text(datosProvider
                                                          .devolverListaComprobanteDatos()[
                                                      index][0]),
                                                  const SizedBox(width: 10),
                                                  Text(datosProvider
                                                          .devolverListaComprobanteDatos()[
                                                      index][1]),
                                                ],
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                )
              : const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Aca se guardarán tus compras',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
