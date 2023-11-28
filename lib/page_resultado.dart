import "package:flutter/material.dart";
import "package:pedilo_ya/provider.dart";
import "package:pedilo_ya/rutas_app.dart";
import "package:provider/provider.dart";

class PaginaResultado extends StatefulWidget {
  const PaginaResultado({super.key});

  @override
  State<PaginaResultado> createState() => _PaginaResultadoState();
}

class _PaginaResultadoState extends State<PaginaResultado> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                ruta.goNamed(Pages.menu.name);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: datosProvider.listaDeComida().length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(fontSize: 35),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              'x${datosProvider.listaDeCantidad()[index]}',
                              style: const TextStyle(fontSize: 35),
                            ),
                          ),
                          SizedBox(
                            width: 700,
                            child: Text(
                              '${datosProvider.listaDeComida()[index]}',
                              style: const TextStyle(fontSize: 35),
                            ),
                          ),
                          Text(
                            '\$${datosProvider.listaDePrecio()[index]}',
                            style: const TextStyle(fontSize: 35),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 125,
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: datosProvider.listaDatosComprobante().length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 20),
                            SizedBox(
                              width: 900,
                              child: Text(
                                '${datosProvider.listaDatosComprobante()[index]}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Text(
                  'TOTAL: \$${datosProvider.calcularTotal()}',
                  style: const TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 100,
                  width: 400,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      iconColor: Colors.white,
                    ),
                    onPressed: () {
                      ruta.goNamed(Pages.fin.name);
                    },
                    icon: const Icon(
                      Icons.check,
                      size: 40,
                    ),
                    label: const Text(
                      'PEDILO YA',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
