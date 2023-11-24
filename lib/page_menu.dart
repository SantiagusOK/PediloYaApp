import "package:flutter/material.dart";
import 'package:pedilo_ya/cartelito.dart';
import 'package:pedilo_ya/provider.dart';
import 'package:provider/provider.dart';

class PaginaMenu extends StatefulWidget {
  const PaginaMenu({super.key});

  @override
  State<PaginaMenu> createState() => _PaginaMenuState();
}

class _PaginaMenuState extends State<PaginaMenu> {
  @override
  Widget build(BuildContext context) {
    DatosProvider datos = Provider.of<DatosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Menu'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              height: 100,
              child: ElevatedButton(
                  onPressed: () {
                    _mostrarDialog(context, 'Pizza Napolitana', 2300,
                        datos.imagenMostrar());
                  },
                  child: const Text('Pizza')),
            ),
            SizedBox(
              width: 500,
              height: 100,
              child: ElevatedButton(
                  onPressed: () {
                    //_showMyDialog('Pizza', 200, "assets/pizza_napolitana.jpg");
                  },
                  child: const Text('Pancho')),
            ),
            const SizedBox(height: 50),
            SizedBox(
              child: TextButton(
                onPressed: () {
                  datos.agregarComidaALaLista('piza', 230, 2);
                  datos.mostrarListaPedido();
                },
                child: const Text('Aceptar'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _mostrarDialog(
      BuildContext context, String name, int price, String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Cartelito(name: name, price: price, image: image);
      },
    );
  }
}
