import "package:flutter/material.dart";
import 'package:pedilo_ya/cartel_seguro.dart';
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
  bool guardarFavorito = true;
  String pediloYaLogo = 'assets/pedilo_logo.png';

  void cambiarFuncionDelBotonFavorito() {
    setState(() {
      if (guardarFavorito) {
        guardarFavorito = false;
      } else {
        guardarFavorito = true;
      }
    });
  }

  void mostrarDialog(
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
          body: Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: datosProvider.devolverListaMenu().length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 250,
                      width: 1150,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 0, 0),
                              offset: Offset(0, 0),
                              blurRadius: 5,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        //////////////////////////// CONTENIDO DEL BOTON ////////////////////////////
                        children: [
                          const SizedBox(width: 15),
                          //////////////////IMAGEN DE LA COMIDA//////////////////
                          Container(
                            height: 220,
                            width: 360,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 0),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                datosProvider.devolverListaMenu()[index][2],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          //////////////////NOMBRE DE LA COMIDA//////////////////
                          SizedBox(
                            width: 400,
                            child: Text(
                                datosProvider.devolverListaMenu()[index][0],
                                style: const TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(width: 150),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    //////////////////////// BOTON PARA COMPRAR //////////////////////////////
                                    IconButton(
                                      onPressed: () {
                                        datosProvider.cambiarPosicion('menu');
                                        datosProvider.guardarComidaAEditar(
                                            datosProvider
                                                .devolverListaMenu()[index][0],
                                            datosProvider
                                                .devolverListaMenu()[index][1],
                                            datosProvider
                                                .devolverListaMenu()[index][2]);
                                        ruta.goNamed(Pages.edit.name);
                                      },
                                      icon: const Icon(Icons.add_box, size: 50),
                                    ),
                                    datosProvider.puedeGuardar(datosProvider
                                            .devolverListaMenu()[index][0])
                                        //////////////////////// BOTON PARA GUARDAR A FAVORITOS //////////////////////////////
                                        ? IconButton(
                                            onPressed: () {
                                              datosProvider.guardarComidaAFavoritos(
                                                  datosProvider
                                                          .devolverListaMenu()[
                                                      index][0],
                                                  datosProvider
                                                          .devolverListaMenu()[
                                                      index][1],
                                                  datosProvider
                                                          .devolverListaMenu()[
                                                      index][2]);
                                              setState(() {
                                                datosProvider.puedeGuardar(
                                                    datosProvider
                                                            .devolverListaMenu()[
                                                        index][0]);
                                              });
                                            },
                                            icon: const Icon(
                                                Icons.favorite_border,
                                                size: 50),
                                          )
                                        : IconButton(
                                            //////////////////////// BOTON PARA GUARDAR A FAVORITOS //////////////////////////////
                                            onPressed: () {
                                              setState(
                                                () {
                                                  datosProvider
                                                      .eliminarComidaAFavoritos(
                                                    datosProvider.devolverIndex(
                                                      datosProvider
                                                              .devolverListaMenu()[
                                                          index][0],
                                                    ),
                                                  );
                                                  datosProvider.puedeGuardar(
                                                      datosProvider
                                                              .devolverListaMenu()[
                                                          index][0]);
                                                },
                                              );
                                            },
                                            icon: const Icon(Icons.favorite,
                                                color: Colors.red, size: 50),
                                          ),
                                  ],
                                ),
                                Text(
                                  '\$${datosProvider.devolverListaMenu()[index][1]}',
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
