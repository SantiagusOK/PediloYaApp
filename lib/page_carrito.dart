import "package:flutter/material.dart";
import "package:pedilo_ya/carte_decision.dart";
import "package:pedilo_ya/carte_direccion.dart";
import "package:pedilo_ya/provider.dart";
import "package:pedilo_ya/rutas_app.dart";
import "package:provider/provider.dart";

class PaginaCarrito extends StatefulWidget {
  const PaginaCarrito({super.key});

  @override
  State<PaginaCarrito> createState() => _PaginaCarritoState();
}

class _PaginaCarritoState extends State<PaginaCarrito> {
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
          appBar: AppBar(
            title: Center(
              child: datosProvider.calcularTotal() != 0
                  ? Text('Total: \$${datosProvider.calcularTotal()}')
                  : Text('Total: \$0'),
            ),
            leading: IconButton(
                onPressed: () {
                  ruta.goNamed(Pages.menu.name);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            actions: [
              Container(
                color: Colors.red,
                width: 100,
                child: TextButton(
                    onPressed: () {
                      ruta.goNamed(Pages.menu.name);
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(width: 20),
              Container(
                color: Colors.green,
                width: 100,
                child: TextButton(
                    onPressed: () {
                      _mostrarCartelDecision(context);
                    },
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(width: 20),
            ],
          ),
          body: ListView.builder(
            itemCount: datosProvider.listaDeComida().length,
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Color.fromARGB(255, 197, 197, 197),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 30),
                          SizedBox(
                            width: 300,
                            child: Text(
                              '${datosProvider.listaDeComida()[index]}',
                              style: const TextStyle(fontSize: 40),
                            ),
                          ),
                          SizedBox(width: 150),
                          SizedBox(
                            child: Text(
                              'x${datosProvider.listaDeCantidad()[index]}',
                              style: const TextStyle(fontSize: 40),
                            ),
                          ),
                          SizedBox(width: 300),
                          SizedBox(
                            child: Text(
                              '\$${datosProvider.listaDePrecio()[index]}',
                              style: const TextStyle(fontSize: 40),
                            ),
                          ),
                          SizedBox(width: 100),
                          IconButton(
                              color: Colors.red,
                              onPressed: () {
                                setState(() {
                                  datosProvider
                                      .eliminarUnaComidaEnLaLista(index);
                                });
                              },
                              icon: Icon(Icons.remove)),
                        ],
                      ),
                    ),
                    SizedBox(height: 2),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
