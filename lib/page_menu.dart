import 'package:flutter/material.dart';
import 'package:pedilo_ya/class_appPedilo.dart';
import 'package:pedilo_ya/rutas.dart';

class PageMenu extends StatelessWidget {
  const PageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PaginaMenu(),
    );
  }
}

class PaginaMenu extends StatefulWidget {
  const PaginaMenu({super.key});

  @override
  State<PaginaMenu> createState() => _PaginaMenuState();
}

class _PaginaMenuState extends State<PaginaMenu> {
  Pedido pedidoApp = Pedido();
  @override
  Future<void> _showMyDialog(String comida) async {
    String comidaText = comida;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(comidaText),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(child: Text('\$200')),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar')),
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Comida comida =
                    Comida(comidaName: 'Hamgurguesa', comidaPrecio: 200);
                pedidoApp.guardarComidaAListaComida(comida);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _showMyDialog('hamburguesa');
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: const Text(
              'Hamburguesa\n\$200',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Comida comida = Comida(comidaName: 'pizza', comidaPrecio: 300);
              pedidoApp.guardarComidaAListaComida(comida);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: const Text(
              'pizza\n\$300',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ));
  }
}
