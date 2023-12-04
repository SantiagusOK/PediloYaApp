import "package:flutter/material.dart";
import "package:pedilo_ya/provider.dart";
import "package:pedilo_ya/rutas_app.dart";
import "package:provider/provider.dart";

class PaginaComprobante extends StatefulWidget {
  const PaginaComprobante({super.key});

  @override
  State<PaginaComprobante> createState() => _PaginaComprobanteState();
}

class _PaginaComprobanteState extends State<PaginaComprobante> {
  String pediloYaLogo = 'assets/pedilo_logo.png';

  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  ruta.goNamed(Pages.fin.name);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
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
            child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(pediloYaLogo),
                        const SizedBox(width: 20),
                        const Text(
                          '|',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'COMPROBANTE',
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
                      itemCount: datosProvider.listaCarrito().length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(width: 10, child: Text('${index + 1}')),
                            SizedBox(
                                width: 100,
                                child: Text(
                                    datosProvider.listaCarrito()[index][0])),
                            SizedBox(
                                width: 50,
                                child: Text(
                                    'x${datosProvider.listaCarrito()[index][1]}')),
                            Text('\$${datosProvider.listaCarrito()[index][2]}')
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
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
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      const SizedBox(width: 10),
                      Text('\$${datosProvider.calcularTotal()}',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white)),
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
                                (BuildContext context, int index) =>
                                    const Divider(
                              color: Colors.red,
                            ),
                            itemBuilder: (BuildContext context, int index) {
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
            ),
          ),
        );
      },
    );
  }
}
