import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedilo_ya/cartel_register_error.dart';
import 'package:pedilo_ya/provider.dart';
import 'package:pedilo_ya/rutas_app.dart';
import 'package:provider/provider.dart';

class PaginaRegistro extends StatefulWidget {
  const PaginaRegistro({super.key});

  @override
  State<PaginaRegistro> createState() => _PaginaRegistroState();
}

class _PaginaRegistroState extends State<PaginaRegistro> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerPass1 = TextEditingController();
  TextEditingController controllerPass2 = TextEditingController();
  TextEditingController controllerAdress = TextEditingController();
  String _name = '';
  String _username = '';
  String _passUser1 = '';
  String _passUser2 = '';
  String _adressUser = '';
  void guardarValores() {
    setState(() {
      _name = controllerName.text;
      _username = controllerUserName.text;
      _passUser1 = controllerPass1.text;
      _passUser2 = controllerPass2.text;
      _adressUser = controllerAdress.text;
    });
  }

  void reiniciarValores() {
    setState(() {
      _name = '';
      _username = '';
      _passUser1 = '';
      _passUser2 = '';
      _adressUser = '';
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
                      'Registrarse',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 500,
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z ]')),
                        ],
                        controller: controllerName,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Nombre y Apellido'),
                      ),
                    ),
                    const SizedBox(width: 30),
                    SizedBox(
                      width: 500,
                      child: TextField(
                        controller: controllerUserName,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Nombre de usuario'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 500,
                      child: TextField(
                        obscureText: true,
                        controller: controllerPass1,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Contraseña'),
                      ),
                    ),
                    const SizedBox(width: 30),
                    SizedBox(
                      width: 500,
                      child: TextField(
                        obscureText: true,
                        controller: controllerPass2,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Confirmar Contraseña'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: controllerAdress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Direccion o Ubicacion'),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 80,
                  width: 250,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    onPressed: () {
                      guardarValores();
                      if (datosProvider.datosNuevos(
                              _username, _passUser1, _passUser2) ==
                          'bien') {
                        datosProvider.guardarNuevoUsuario(
                            _username, _passUser1, _name, _adressUser);
                        reiniciarValores();
                        ruta.goNamed(Pages.inicio.name);
                      } else if (datosProvider.datosNuevos(
                              _username, _passUser1, _passUser2) ==
                          'null') {
                        _mostrarCartelError(
                            context, 'Ingrese valores antes de registrarse');
                      } else if (datosProvider.datosNuevos(
                              _username, _passUser1, _passUser2) ==
                          'c1!=c2') {
                        _mostrarCartelError(
                            context, 'Las contraseñas no coinciden');
                      } else if (datosProvider.datosNuevos(
                              _username, _passUser1, _passUser2) ==
                          'u==ou') {
                        _mostrarCartelError(
                            context, 'El nombre de usuario ya existe');
                      }
                      reiniciarValores();
                    },
                    child: const Text(
                      'Registrarse',
                      style: TextStyle(color: Colors.white),
                    ),
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
