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
  void initState() {
    super.initState();
    DatosProvider datosProvider =
        Provider.of<DatosProvider>(context, listen: false);
    datosProvider.guardarComidaASaved();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.red,
            title: Center(
              child: SizedBox(
                width: 200,
                height: 30,
                child: Image.asset(pediloYaLogo),
              ),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: datosProvider.listaCarrito().length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 5,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
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
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                    height: 100,
                    width: 1000,
                    decoration: BoxDecoration(
                        /*boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 0, 0, 0),
                            offset: Offset(0.0, 0.0),
                            blurRadius: 1,
                          ),
                        ],*/
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0)),
                    child: Expanded(
                      child: ListView.separated(
                        itemCount: datosProvider
                            .devolverListaComprobanteDatos()
                            .length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          color: Colors.red,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(datosProvider
                                  .devolverListaComprobanteDatos()[index][0]),
                              const SizedBox(width: 10),
                              Text(datosProvider
                                  .devolverListaComprobanteDatos()[index][1]),
                            ],
                          );
                        },
                      ),
                    )),
                const SizedBox(
                  height: 100,
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
                                datosProvider.guardarComidaAMisCompras();
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
