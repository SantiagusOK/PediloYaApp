import "package:flutter/material.dart";
import "package:pedilo_ya/carte_decision.dart";
import "package:pedilo_ya/cartel_seguro.dart";

import "package:pedilo_ya/provider.dart";
import "package:pedilo_ya/rutas_app.dart";
import "package:provider/provider.dart";

class PaginaCarrito extends StatefulWidget {
  const PaginaCarrito({super.key});

  @override
  State<PaginaCarrito> createState() => _PaginaCarritoState();
}

class _PaginaCarritoState extends State<PaginaCarrito> {
  String pediloYaLogo = 'assets/pedilo_logo.png';
  void _mostrarCartelSeguro(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CartelSeguro();
      },
    );
  }

  void _mostrarCartelDecision(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CartelDesicion();
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
          body: datosProvider.listaCarrito().isNotEmpty
              ? Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: datosProvider.listaCarrito().length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 20),
                                Container(
                                  width: 1200,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 10,
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(width: 30),
                                      SizedBox(
                                        width: 300,
                                        child: Text(
                                          '${datosProvider.listaCarrito()[index][0]}',
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                      ),
                                      const SizedBox(width: 150),
                                      SizedBox(
                                        child: Text(
                                          'x${datosProvider.listaCarrito()[index][1]}',
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                      ),
                                      const SizedBox(width: 300),
                                      SizedBox(
                                        child: Text(
                                          '\$${datosProvider.listaCarrito()[index][2]}',
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                      ),
                                      const SizedBox(width: 100),
                                      IconButton(
                                          color: Colors.red,
                                          onPressed: () {
                                            setState(() {
                                              datosProvider
                                                  .eliminarUnaComidaEnLaLista(
                                                      index);
                                            });
                                          },
                                          icon: const Icon(Icons.remove)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 90,
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          datosProvider.calcularTotal() != 0
                              ? Text(
                                  'TOTAL: \$${datosProvider.calcularTotal()}',
                                  style: const TextStyle(
                                      fontSize: 40, color: Colors.white),
                                )
                              : const Text(
                                  'TOTAL: \$0',
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: IconButton(
                                  style: IconButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 202, 56, 56)),
                                  iconSize: 50,
                                  onPressed: () {
                                    ruta.goNamed(Pages.menu.name);
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 150,
                                child: IconButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                  iconSize: 50,
                                  onPressed: () {
                                    _mostrarCartelDecision(context);
                                  },
                                  icon: const Icon(
                                    Icons.check,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : const Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'El carrito esta vacio',
                          style: TextStyle(fontSize: 20),
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
