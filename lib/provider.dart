import 'package:flutter/material.dart';
import 'package:pedilo_ya/pedilo_ya.dart';

class DatosProvider extends ChangeNotifier {
  PediloYaApp _pediloYaApp = PediloYaApp();
  PediloYaApp get pediloYaApp => _pediloYaApp;

  void agregarComidaALaLista(String comida, int precio) {
    _pediloYaApp.listaPedidoComida.add(comida);
    _pediloYaApp.listaPedidoPrecio.add(precio);
    notifyListeners();
  }

  void mostrarListaPedido() {
    for (int nPedido = 0;
        nPedido < _pediloYaApp.listaPedidoComida.length;
        nPedido++) {
      print(_pediloYaApp.listaPedidoComida[nPedido]);
    }
  }

  void calcularTotal() {
    for (int precio = 0;
        precio < _pediloYaApp.listaPedidoPrecio.length;
        precio++) {
      _pediloYaApp.totalPrecio =
          _pediloYaApp.totalPrecio + _pediloYaApp.listaPedidoPrecio[precio];
      notifyListeners();
    }
  }
}
