import "package:flutter/material.dart";
import "package:pedilo_ya/provider.dart";

class Cartelito extends StatefulWidget {
  const Cartelito(
      {super.key,
      required this.name,
      required this.price,
      required this.image});
  final String name;
  final int price;
  final String image;

  @override
  State<Cartelito> createState() => _CartelitoState();
}

class _CartelitoState extends State<Cartelito> {
  int cantidad = 1;
  bool cantidadNoIgualAUno = false;

  void _cantidadIgualUno() {
    setState(() {
      if (cantidad == 1) {
        cantidadNoIgualAUno = false;
      } else {
        cantidadNoIgualAUno = true;
      }
    });
  }

  void _botonesCantidad(String decision) {
    setState(() {
      switch (decision) {
        case 'v+':
          cantidad++;
        case 'v-':
          cantidad--;
          if (cantidad < 1) {
            cantidad = 1;
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    DatosProvider datos = DatosProvider();
    return AlertDialog(
      content: SizedBox(
        width: 500,
        height: 500,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                child: Image.asset(widget.image, height: 250),
              ),
              Text(
                widget.name,
                style: const TextStyle(fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Cantidad:', style: TextStyle(fontSize: 30)),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            _botonesCantidad('v+');
                          },
                          icon: const Icon(Icons.keyboard_arrow_up_rounded)),
                      Text(
                        'x$cantidad',
                        style: const TextStyle(fontSize: 30),
                      ),
                      cantidadNoIgualAUno == false
                          ? IconButton(
                              onPressed: () {
                                _botonesCantidad('v-');
                              },
                              icon:
                                  const Icon(Icons.keyboard_arrow_down_rounded))
                          : Container(),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text('\$${widget.price}', style: const TextStyle(fontSize: 30)),
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
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(fontSize: 30),
                  )),
              const SizedBox(width: 200),
              TextButton(
                  onPressed: () {
                    datos.agregarComidaALaLista(
                        widget.name, widget.price, cantidad);

                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(fontSize: 30),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
