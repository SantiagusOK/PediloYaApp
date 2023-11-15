import 'package:flutter/material.dart';
import 'package:pedilo_ya/rutas.dart';

class PageInicio extends StatelessWidget {
  const PageInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PaginaInicio(),
    );
  }
}

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('PEDILO YA'),
            const SizedBox(height: 200),
            ElevatedButton(
              onPressed: () {
                router.goNamed(Pages.pageLogin.name);
              },
              style: ElevatedButton.styleFrom(fixedSize: const Size(400, 60)),
              child: const Text('Iniciar Sesion'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(fixedSize: const Size(400, 60)),
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
