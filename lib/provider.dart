import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pedilo_ya/pedilo_ya.dart';

class DatosProvider extends ChangeNotifier {
  PediloYaApp _pediloYaApp = PediloYaApp();
  PediloYaApp get pediloYaApp => _pediloYaApp;

  void agregarComidaALaLista(String comida, double precio, int cantidad) {
    _pediloYaApp.listaPedidoComida.add(comida);
    _pediloYaApp.listaPedidoPrecio.add(precio);
    _pediloYaApp.listaPedidoCantidad.add(cantidad);
    notifyListeners();
  }

  int cantidadComidaEnELCArrito() {
    _pediloYaApp.cantidadCarrito = _pediloYaApp.listaPedidoCantidad.length;
    return _pediloYaApp.listaPedidoComida.length;
  }

  List listaDeComida() {
    return _pediloYaApp.listaPedidoComida;
  }

  List listaDatosComprobante() {
    return _pediloYaApp.listaDatosComprobante;
  }

  List listaDePrecio() {
    return _pediloYaApp.listaPedidoPrecio;
  }

  List listaDeCantidad() {
    return _pediloYaApp.listaPedidoCantidad;
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

  bool datosEstanEnLista(String name, String pass) {
    for (int p = 0; p < _pediloYaApp.listaUserName.length; p++) {
      if (_pediloYaApp.listaUserName[p] == name &&
          _pediloYaApp.listaPassUser[p] == pass) {
        return true;
      }
    }
    return false;
  }

  void eliminarUnaComidaEnLaLista(int index) {
    _pediloYaApp.listaPedidoComida.removeAt(index);
    _pediloYaApp.listaPedidoCantidad.removeAt(index);
    _pediloYaApp.listaPedidoPrecio.removeAt(index);
  }

  void mostrarDatos() {
    print("""
${_pediloYaApp.listaUserName}
${_pediloYaApp.listaPassUser}
""");
  }

  String verificarLogin(String name, String pass) {
    if (name == '' || pass == '') {
      return 'null';
    }
    for (int p = 0; p < _pediloYaApp.listaUserName.length; p++) {
      if (_pediloYaApp.listaUserName[p] == name &&
          _pediloYaApp.listaPassUser[p] == pass) {
        _pediloYaApp.userLoginNow = _pediloYaApp.listaNombreYApellido[p];
        return 'bien';
      }
    }
    return 'error';
  }

  void guardarNombreYApellido(String nameUser) {
    _pediloYaApp.userLoginNow = nameUser;
  }

  String nombreUserNow() {
    return _pediloYaApp.userLoginNow;
  }

  void guardarNuevoUsuario(
      String userName, String pass, String name, String adress) {
    _pediloYaApp.listaUserName.add(userName);
    _pediloYaApp.listaPassUser.add(pass);
    _pediloYaApp.listaNombreYApellido.add(name);
    _pediloYaApp.listaAdress.add(adress);
  }

  String datosNuevos(String name, String pass1, String pass2) {
    if (pass1 == '' || name == '') {
      return 'null';
    }
    if (pass1 != pass2) {
      return 'c1!=c2';
    }
    for (int p = 0; p < _pediloYaApp.listaUserName.length; p++) {
      if (_pediloYaApp.listaUserName[p] == name) {
        return 'u==ou';
      }
    }
    return 'bien';
  }

  double calcularTotal() {
    _pediloYaApp.totalPrecio = 0;
    for (int precio = 0;
        precio < _pediloYaApp.listaPedidoPrecio.length;
        precio++) {
      _pediloYaApp.totalPrecio =
          _pediloYaApp.totalPrecio + _pediloYaApp.listaPedidoPrecio[precio];
    }
    return _pediloYaApp.totalPrecio;
  }

  List listaComida() {
    return _pediloYaApp.listaMenuComida;
  }

  List listaPrecio() {
    return _pediloYaApp.listaMenuPrecio;
  }

  List listaImagen() {
    return _pediloYaApp.listaMenuImagenComida;
  }
}
