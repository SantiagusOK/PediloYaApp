import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedilo_ya/provider.dart';
import 'package:pedilo_ya/rutas_app.dart';
import 'package:provider/provider.dart';

class PaginaTarjetaEdit extends StatefulWidget {
  const PaginaTarjetaEdit({super.key});

  @override
  State<PaginaTarjetaEdit> createState() => _PaginaTarjetaEditState();
}

class _PaginaTarjetaEditState extends State<PaginaTarjetaEdit> {
  TextEditingController numeroTarjeta = TextEditingController();
  TextEditingController numeroFechaC1 = TextEditingController();
  TextEditingController numeroFechaC2 = TextEditingController();
  TextEditingController numeroFechaVc1 = TextEditingController();
  TextEditingController numeroFechaVc2 = TextEditingController();
  TextEditingController nombreYapellido = TextEditingController();
  String tipo = 'debito';
  String tarjNum = '';
  String fechaC1 = '';
  String fechaC2 = '';
  String fechaVc1 = '';
  String fechaVc2 = '';
  String nombre = '';
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
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 600,
                height: 500,
                padding: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxLength: 16,
                            controller: numeroTarjeta,
                            onChanged: (text) {
                              setState(() {
                                tarjNum = text;
                              });
                            },
                            decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'N° de tarjeta'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Fecha de vencimiento:',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            maxLength: 2,
                            textAlign: TextAlign.center,
                            controller: numeroFechaVc1,
                            onChanged: (valor) {
                              setState(() {
                                fechaVc1 = valor;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: 'mm',
                                counterText: '',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          '/',
                          style: TextStyle(fontSize: 50),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxLength: 2,
                            textAlign: TextAlign.center,
                            controller: numeroFechaVc2,
                            onChanged: (valor) {
                              setState(() {
                                fechaVc2 = valor;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: 'aa',
                                counterText: '',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        const SizedBox(width: 20),
                        DropdownButton<String>(
                          value: tipo,
                          focusColor: Colors.transparent,
                          onChanged: (String? newTipo) {
                            setState(() {
                              tipo = newTipo!;
                            });
                          },
                          items: const [
                            DropdownMenuItem<String>(
                              value: 'debito',
                              child: Text('Debito'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'credito',
                              child: Text('credito'),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z ]')),
                        ],
                        maxLength: 23,
                        controller: nombreYapellido,
                        onChanged: (text) {
                          setState(() {
                            nombre = text.toUpperCase();
                          });
                        },
                        decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Propietario de la tarjeta'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              ruta.goNamed(Pages.tarjeta.name);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.close, color: Colors.white),
                                Text('Cancelar',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              String verificacion =
                                  datosProvider.verificarDatosTarjetas(
                                      tarjNum, fechaVc1, fechaVc2, nombre);
                              switch (verificacion) {
                                case 'vacio':
                                  mostrarSnakbar(
                                      'Trate de rellenar todas las casillas con la informacion');
                                case 'misma tarjeta':
                                  mostrarSnakbar(
                                      'Esta tarjeta ya la tienes registrada');
                                case 'mal fecha mes':
                                  mostrarSnakbar(
                                      'Ingrese bien el mes de cierre de la tarjeta');
                                case 'mal fecha año1':
                                  mostrarSnakbar(
                                      'Esta tarjeta ya se encuentra vencida para que sea usada en la app');
                                case 'mal fecha año2':
                                  mostrarSnakbar(
                                      'Año de caducida mal colocada');
                                case 'nombre mal1' ||
                                      'nombre mal2' ||
                                      'nombre mal3':
                                  mostrarSnakbar(
                                      'Escriba bien el nombre del propietario de la tarjeta');
                                case 'bien':
                                  int fechaMes = int.parse(fechaVc1);
                                  int fechaYear = int.parse(fechaVc2);
                                  datosProvider.agregarNuevaTarjeta(nombre,
                                      tarjNum, tipo, fechaMes, fechaYear);
                                  ruta.goNamed(Pages.tarjeta.name);
                              }
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Listo',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 300,
                width: 550,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 30, 85, 131),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 110,
                      left: 450,
                      child: Text(tipo,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20)),
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
                        tarjNum,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 45),
                      ),
                    ),
                    Positioned(
                      top: 210,
                      left: 150,
                      child: Text(
                        '$fechaVc1 / $fechaVc2',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Positioned(
                      top: 230,
                      left: 35,
                      child: Text(
                        nombre,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
