import "package:flutter/material.dart";
import 'package:pedilo_ya/cartel_seguro.dart';
import 'package:pedilo_ya/cartelito.dart';
import 'package:pedilo_ya/provider.dart';
import 'package:pedilo_ya/rutas_app.dart';
import 'package:provider/provider.dart';

class PaginaFavorito extends StatefulWidget {
  const PaginaFavorito({super.key});

  @override
  State<PaginaFavorito> createState() => _PaginaFavoritoState();
}

class _PaginaFavoritoState extends State<PaginaFavorito> {
  String pediloYaLogo = 'assets/pedilo_logo.png';
  void _mostrarDialog(
      BuildContext context, String name, int price, String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Cartelito(name: name, price: price, image: image);
      },
    );
  }

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
              padding: EdgeInsets.zero,
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
                      Icon(Icons.menu_book_rounded),
                      SizedBox(width: 20),
                      Text(
                        'Menu',
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
                      Icon(Icons.shopping_cart),
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
                      Icon(Icons.favorite),
                      SizedBox(width: 20),
                      Text(
                        'Favorito',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    datosProvider.cambiarPosicion('favoritos');
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
            )),
          ),
          body: datosProvider.listaFavoritos().isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: datosProvider.listaFavoritos().length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            height: 250,
                            width: 1150,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 20,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Row(
                                //////////////////////////// CONTENIDO DEL BOTON ////////////////////////////
                                children: [
                                  const SizedBox(width: 15),
                                  Container(
                                    height: 220,
                                    width: 360,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 15,
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        datosProvider.listaFavoritos()[index]
                                            [2],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    width: 400,
                                    child: Text(
                                        datosProvider.listaFavoritos()[index]
                                            [0],
                                        style: const TextStyle(fontSize: 35)),
                                  ),
                                  const SizedBox(width: 150),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                datosProvider.cambiarPosicion(
                                                    'favorito');
                                                datosProvider.guardarComidaAEditar(
                                                    datosProvider
                                                            .listaFavoritos()[
                                                        index][0],
                                                    datosProvider
                                                            .listaFavoritos()[
                                                        index][1],
                                                    datosProvider
                                                            .listaFavoritos()[
                                                        index][2]);
                                                ruta.goNamed(Pages.edit.name);
                                              },
                                              icon: const Icon(
                                                Icons.add_box,
                                                size: 50,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  datosProvider
                                                      .eliminarComidaAFavoritos(
                                                          index);
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                color: Colors.red,
                                                size: 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '\$${datosProvider.listaFavoritos()[index][1]}',
                                          style: const TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  ),
                )
              : const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Aca se guardarán tus comidas favoritas',
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
