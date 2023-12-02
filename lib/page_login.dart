import 'package:flutter/material.dart';
import 'package:pedilo_ya/cartel_register_error.dart';
import 'package:pedilo_ya/provider.dart';
import 'package:pedilo_ya/rutas_app.dart';
import 'package:provider/provider.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({super.key});

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  TextEditingController _controllerUserName = TextEditingController();
  TextEditingController _controllerPass1 = TextEditingController();

  String _username = '';
  String _passUser1 = '';
  void guardarValores() {
    setState(() {
      _username = _controllerUserName.text;
      _passUser1 = _controllerPass1.text;
    });
  }

  void reiniciarValores() {
    setState(() {
      _username = '';
      _passUser1 = '';
    });
  }

  void _mostrarCartelError(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CartelRError(mensajeError: mensaje);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    DatosProvider datosProvider =
        Provider.of<DatosProvider>(context, listen: false);
    datosProvider.cargarDatos();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            leading: Center(
              child: IconButton(
                onPressed: () {
                  ruta.goNamed(Pages.inicio.name);
                },
                icon: const SizedBox(
                  child:
                      Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                ),
              ),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  height: 100,
                  width: 2000,
                  child: const Center(
                    child: Text(
                      'Iniciar Sesion',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 500,
                        child: TextField(
                          controller: _controllerUserName,
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 500,
                        child: TextField(
                          obscureText: true,
                          controller: _controllerPass1,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              labelText: 'Contraseña'),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 80,
                        width: 250,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {
                              guardarValores();
                              if (datosProvider.verificarLogin(
                                      _username, _passUser1) ==
                                  'bien') {
                                reiniciarValores();
                                ruta.goNamed(Pages.welcome.name);
                                Future.delayed(const Duration(seconds: 3), () {
                                  ruta.goNamed(Pages.menu.name);
                                });
                              } else if (datosProvider.verificarLogin(
                                      _username, _passUser1) ==
                                  'null') {
                                reiniciarValores();
                                _mostrarCartelError(context,
                                    'Ingrese sus datos para iniciar sesion');
                              } else if (datosProvider.verificarLogin(
                                      _username, _passUser1) ==
                                  'error') {
                                reiniciarValores();
                                _mostrarCartelError(context,
                                    'Nombre de usuario o Contraseña incorrectos');
                              }
                            },
                            child: const Text('Iniciar Session')),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
