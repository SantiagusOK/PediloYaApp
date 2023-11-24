import 'package:flutter/material.dart';
import 'package:pedilo_ya/pedilo_ya.dart';

class DatosProvider extends ChangeNotifier {
  PediloYaApp _pediloYaApp = PediloYaApp();
  PediloYaApp get pediloYaApp => _pediloYaApp;

  void agregarComidaALaLista(String comida, int precio, int cantidad) {
    _pediloYaApp.listaPedidoComida.add(comida);
    _pediloYaApp.listaPedidoPrecio.add(precio);
    _pediloYaApp.listaPedidoCantidad.add(cantidad);
    notifyListeners();
  }

  void mostrarListaPedido() {
    for (int nPedido = 0;
        nPedido < _pediloYaApp.listaPedidoComida.length;
        nPedido++) {
      print(
          '${_pediloYaApp.listaPedidoComida[nPedido]}   ${_pediloYaApp.listaPedidoCantidad[nPedido]}   \$${_pediloYaApp.listaPedidoPrecio[nPedido]}');
    }
    notifyListeners();
  }

  String imagenMostrar(String comida) {
    switch (comida) {
      case 'pizza_napo':
        return _pediloYaApp.imagenPizzaNapolitana;
      case 'pancho':
        return _pediloYaApp.imagenPancho;
      default:
        return _pediloYaApp.imagenNada;
    }
  }

  int totalCantidad(int price, int cantidad) {
    price = price * cantidad;
    return price;
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
