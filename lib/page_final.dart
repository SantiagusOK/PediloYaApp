import "package:flutter/material.dart";
import "package:pedilo_ya/rutas_app.dart";

class PaginaFinal extends StatefulWidget {
  const PaginaFinal({super.key});

  @override
  State<PaginaFinal> createState() => _PaginaFinalState();
}

class _PaginaFinalState extends State<PaginaFinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Su pedido fue tomado :)',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    ruta.goNamed(Pages.menu.name);
                  },
                  child: const Text(
                    'Volver',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 82, 72, 71)),
                  ),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Ver Comprobante',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 82, 72, 71)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
