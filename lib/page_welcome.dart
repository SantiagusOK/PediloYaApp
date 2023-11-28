import 'package:flutter/material.dart';

import 'package:pedilo_ya/provider.dart';

import 'package:provider/provider.dart';

class PaginaWelcome extends StatefulWidget {
  const PaginaWelcome({super.key});

  @override
  State<PaginaWelcome> createState() => _PaginaWelcomeState();
}

class _PaginaWelcomeState extends State<PaginaWelcome> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return Scaffold(
          backgroundColor: Colors.green,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Bienvenido',
                    style: TextStyle(fontSize: 50, color: Colors.white)),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(datosProvider.nombreUserNow(),
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white)),
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
