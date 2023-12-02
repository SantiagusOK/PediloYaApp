import 'package:flutter/material.dart';

import 'package:pedilo_ya/provider.dart';

import 'package:provider/provider.dart';

class PaginaBye extends StatefulWidget {
  const PaginaBye({super.key});

  @override
  State<PaginaBye> createState() => _PaginaByeState();
}

class _PaginaByeState extends State<PaginaBye> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 99, 43, 39),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Adios',
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
