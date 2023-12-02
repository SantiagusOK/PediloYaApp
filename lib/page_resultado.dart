import "package:flutter/material.dart";
import "package:pedilo_ya/cartel_cancelar.dart";
import "package:pedilo_ya/provider.dart";
import "package:pedilo_ya/rutas_app.dart";
import "package:provider/provider.dart";

class PaginaResultado extends StatefulWidget {
  const PaginaResultado({super.key});

  @override
  State<PaginaResultado> createState() => _PaginaResultadoState();
}

class _PaginaResultadoState extends State<PaginaResultado> {
  String pediloYaLogo = 'assets/pedilo_logo.png';
  void _mostrarCartelDecision(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CartelCancelarPedido();
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
            leading: IconButton(
              onPressed: () {
                ruta.goNamed(Pages.menu.name);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
            title: Center(
                child: SizedBox(
              width: 200,
              height: 30,
              child: Image.asset(pediloYaLogo),
            )),
          ),
          body: Center(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: datosProvider.listaCarrito().length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 50,
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(fontSize: 35),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  'x${datosProvider.listaCarrito()[index][1]}',
                                  style: const TextStyle(fontSize: 35),
                                ),
                              ),
                              SizedBox(
                                width: 350,
                                child: Text(
                                  '${datosProvider.listaCarrito()[index][0]}',
                                  style: const TextStyle(fontSize: 35),
                                ),
                              ),
                              Text(
                                '\$${datosProvider.listaCarrito()[index][2]}',
                                style: const TextStyle(fontSize: 35),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  height: 250,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            width: 300,
                            child: Text(
                              'Pedido a nombre de: ',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Text(
                              datosProvider.nombreUserNow(),
                              style: const TextStyle(fontSize: 30),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            width: 300,
                            child: Text(
                              'Tipo de pago:',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Text(
                              datosProvider.mostrarTipoDePago(),
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            width: 300,
                            child: Text(
                              'Direccion:',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Text(
                              datosProvider.mostrarDireccion(),
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'TOTAL: \$${datosProvider.calcularTotal()}',
                        style:
                            const TextStyle(fontSize: 50, color: Colors.white),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 350,
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                                iconColor: Colors.white,
                              ),
                              onPressed: () {
                                _mostrarCartelDecision(context);
                              },
                              icon: const Icon(
                                Icons.cancel_rounded,
                                size: 40,
                              ),
                              label: const Text(
                                'CANCELAR PEDIDO',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                            width: 300,
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.green,
                                iconColor: Colors.white,
                              ),
                              onPressed: () {
                                datosProvider.borrarPedidos();
                                ruta.goNamed(Pages.fin.name);
                              },
                              icon: const Icon(
                                Icons.check,
                                size: 40,
                              ),
                              label: const Text(
                                'PEDILO YA',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
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
