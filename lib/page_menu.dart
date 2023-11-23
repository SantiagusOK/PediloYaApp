import "package:flutter/material.dart";
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
                    datos.agregarComidaALaLista('pizza', 200);
                  },
                  child: const Text('Pizza')),
            ),
            SizedBox(
              width: 500,
              height: 100,
              child: ElevatedButton(
                  onPressed: () {
                    _showMyDialog();
                    datos.agregarComidaALaLista('Pancho', 200);
                  },
                  child: const Text('Pancho')),
            ),
            const SizedBox(height: 50),
            SizedBox(
              child: TextButton(
                onPressed: () {},
                child: const Text('Aceptar'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text('Aceptar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  TextButton(
                    child: const Text('Cerrar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
