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
  void actualizarDatos() {}
  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(builder: (context, datosProvider, child) {
      return Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 500,
                        child: Expanded(
                          child: TextField(
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
                                labelText: 'N° de tarjeta'),
                          ),
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
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 350,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            maxLength: 2,
                            textAlign: TextAlign.center,
                            controller: numeroFechaC1,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (valor) {
                              setState(() {
                                fechaC1 = valor;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: 'dd',
                                counterText: '',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text('/', style: TextStyle(fontSize: 50)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            maxLength: 2,
                            textAlign: TextAlign.center,
                            controller: numeroFechaC2,
                            onChanged: (valor) {
                              setState(() {
                                fechaC2 = valor;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: 'mm',
                                counterText: '',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        const SizedBox(width: 50),
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
                                hintText: 'dd',
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
                            maxLength: 2,
                            textAlign: TextAlign.center,
                            controller: numeroFechaVc2,
                            onChanged: (valor) {
                              setState(() {
                                fechaVc2 = valor;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: 'mm',
                                counterText: '',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 500,
                    child: TextField(
                      controller: nombreYapellido,
                      onChanged: (text) {
                        setState(() {
                          nombre = text;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Apellidos y Nombres'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
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
                      SizedBox(width: 30),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () {
                            int numero = int.parse(tarjNum);
                            String fechaC = '$fechaC1 / $fechaC2';
                            String fechaV = '$fechaVc1 / $fechaVc2';
                            datosProvider.agregarNuevaTarjeta(
                                nombre, numero, tipo, fechaC, fechaV);
                            ruta.goNamed(Pages.tarjeta.name);
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
              Container(
                height: 300,
                width: 550,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 30, 85, 131),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 110,
                      left: 450,
                      child: Text(tipo,
                          style: TextStyle(color: Colors.white, fontSize: 20)),
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
                        '$tarjNum',
                        style: TextStyle(color: Colors.white, fontSize: 45),
                      ),
                    ),
                    Positioned(
                      top: 210,
                      left: 150,
                      child: Row(
                        children: [
                          Text(
                            '$fechaC1 / $fechaC2 ',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(width: 50),
                          Text(
                            '$fechaVc1 / $fechaVc2',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 230,
                      left: 35,
                      child: Text(
                        nombre,
                        style: TextStyle(color: Colors.white, fontSize: 35),
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
