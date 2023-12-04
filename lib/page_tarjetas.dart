import 'package:flutter/material.dart';
import 'package:pedilo_ya/provider.dart';
import 'package:pedilo_ya/rutas_app.dart';
import 'package:provider/provider.dart';

class PaginaTarjetas extends StatefulWidget {
  const PaginaTarjetas({super.key});

  @override
  State<PaginaTarjetas> createState() => _PaginaTarjetasState();
}

class _PaginaTarjetasState extends State<PaginaTarjetas> {
  String pediloYaLogo = 'assets/pedilo_logo.png';
  bool seSeleccionoUnaTarjeta = false;
  int tarjetaSeleccionada = 0;
  String decision = 'nada';
  void mostrarSnakbar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(builder: (context, datosProvider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
              onPressed: () {
                ruta.goNamed(Pages.carrito.name);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          title: Center(
            child: SizedBox(
              width: 200,
              height: 30,
              child: Image.asset(pediloYaLogo),
            ),
          ),
        ),
        body: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Tus tarjetas:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            datosProvider.devolverListasTarjetas().length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const SizedBox(height: 20),
                              Container(
                                height: 300,
                                width: 550,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(197, 0, 0, 0),
                                      offset: Offset(0.0, 0.0),
                                      blurRadius: 10,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 30, 85, 131),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  onPressed: () {
                                    seSeleccionoUnaTarjeta = true;
                                    tarjetaSeleccionada = index;
                                  },
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 110,
                                        left: 400,
                                        child: Text(
                                            datosProvider
                                                    .devolverListasTarjetas()[
                                                index][2],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                      Positioned(
                                        top: 100,
                                        left: 40,
                                        child: SizedBox(
                                          height: 50,
                                          child: Image.asset('assets/chip.png'),
                                        ),
                                      ),
                                      Positioned(
                                        top: 150,
                                        left: 40,
                                        child: Text(
                                          '${datosProvider.devolverListasTarjetas()[index][1]}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 45),
                                        ),
                                      ),
                                      Positioned(
                                        top: 210,
                                        left: 150,
                                        child: Row(
                                          children: [
                                            Text(
                                              '${datosProvider.devolverListasTarjetas()[index][3]}',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                            const SizedBox(width: 50),
                                            Text(
                                              '${datosProvider.devolverListasTarjetas()[index][4]}',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 230,
                                        left: 0,
                                        child: Text(
                                          '${datosProvider.devolverListasTarjetas()[index][0]}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 35),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      child: SizedBox(
                        height: 200,
                        width: 500,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 207, 207, 207),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            iconColor: const Color.fromARGB(255, 88, 88, 88),
                          ),
                          onPressed: () {
                            ruta.goNamed(Pages.tarjetaEdit.name);
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Agregar nueva tarjeta',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 88, 88, 88),
                                    fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SizedBox(
                        height: 200,
                        width: 500,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 207, 207, 207),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            iconColor: const Color.fromARGB(255, 88, 88, 88),
                          ),
                          onPressed: () {
                            if (seSeleccionoUnaTarjeta) {
                              seSeleccionoUnaTarjeta = false;
                              setState(() {
                                datosProvider.cambiarTipoDePago('tarjeta');
                                ruta.goNamed(Pages.resultado.name);
                              });
                            } else {
                              mostrarSnakbar(
                                  'Seleccione una tarjeta para utilizarla');
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check),
                              SizedBox(width: 10),
                              Text('Seleccionar Tarjeta',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 88, 88, 88),
                                      fontSize: 30)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SizedBox(
                        height: 200,
                        width: 500,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 207, 207, 207),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            iconColor: const Color.fromARGB(255, 88, 88, 88),
                          ),
                          onPressed: () {
                            if (seSeleccionoUnaTarjeta) {
                              setState(() {
                                seSeleccionoUnaTarjeta = false;
                                datosProvider
                                    .eliminarTarjeta(tarjetaSeleccionada);
                                mostrarSnakbar('se borró una tarjeta');
                              });
                            } else {
                              mostrarSnakbar(
                                  'Seleccione una tarjeta para borrarla');
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.close),
                              SizedBox(width: 10),
                              Text('Eliminar Tarjeta',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 88, 88, 88),
                                      fontSize: 30)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
