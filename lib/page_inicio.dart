import "package:flutter/material.dart";
import "package:pedilo_ya/provider.dart";

import "package:pedilo_ya/rutas_app.dart";
import "package:provider/provider.dart";

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  String imageLogo = 'assets/pedilo_logo.png';
  String fondo = 'assets/fondo.jpg';
  List<String> frasesPedila = [];
  @override
  void initState() {
    super.initState();
    DatosProvider datosProvider =
        Provider.of<DatosProvider>(context, listen: false);
    datosProvider.cargarDatos();
    //datosProvider.borrarDatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(fondo),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  height: 350,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                          child: Image.asset(imageLogo),
                        ),
                        const Text(
                          '"Hay que proceder a pedirla"',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  height: 100,
                  width: 400,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black),
                    onPressed: () {
                      ruta.goNamed(Pages.login.name);
                    },
                    child: const Text(
                      'Iniciar Sesion',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  width: 350,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black),
                    onPressed: () {
                      ruta.goNamed(Pages.register.name);
                    },
                    child: const Text('Registrarse',
                        style: TextStyle(color: Colors.black, fontSize: 30)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
