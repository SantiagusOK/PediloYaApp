import "package:flutter/material.dart";

import "package:pedilo_ya/provider.dart";

import "package:provider/provider.dart";

class CartelRError extends StatefulWidget {
  const CartelRError({super.key, required this.mensajeError});
  final String mensajeError;
  @override
  State<CartelRError> createState() => _CartelRegisterState();
}

class _CartelRegisterState extends State<CartelRError> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatosProvider>(
      builder: (context, datosProvider, child) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'ERROR',
              style: TextStyle(fontSize: 30),
            ),
          ),
          content: SizedBox(
            width: 400,
            height: 100,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.mensajeError,
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Okey'))
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
