import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pedilo_ya/pedilo_ya.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatosProvider extends ChangeNotifier {
  PediloYaApp _pediloYaApp = PediloYaApp();
  PediloYaApp get pediloYaApp => _pediloYaApp;
  List listaFavoritos() {
    List listFavorito =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][4];
    print(listFavorito);
    return listFavorito;
  }

  List listaFavoritoVacia() {
    List listFavorito =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][4];

    return listFavorito[0];
  }

  List devolverComidaAEditar() {
    List listaDatosComida = [
      _pediloYaApp.comidaElegida,
      _pediloYaApp.comidaPrecioElegida,
      _pediloYaApp.comidaImagenElegida
    ];
    return listaDatosComida;
  }

  void organizarComidaCarrito() {
    List listaC = _pediloYaApp.listaCarrito;

    for (int p = 0; p < listaC.length; p++) {
      if (p == listaC.length - 1) {
        break;
      }
      for (int p1 = p + 1; p1 < listaC.length; p1++) {
        if (listaC[p][0] == listaC[p1][0]) {
          int cantidad = listaC[p][1] + listaC[p1][1];
          int precio = listaC[p][2] + listaC[p1][2];
          listaC[p] = [listaC[p][0], cantidad, precio];
          //print('lista antes: $listaC');
          listaC.removeAt(p1);
          //print('lista despues: $listaC');
        }
      }
    }
    _pediloYaApp.listaCarrito = listaC;
  }

  void guardarComidaAEditar(String comida, int precio, String imagen) {
    _pediloYaApp.comidaElegida = comida;
    _pediloYaApp.comidaPrecioElegida = precio;
    _pediloYaApp.comidaImagenElegida = imagen;
  }

  String devovlerPosicion() {
    return _pediloYaApp.posicion;
  }

  void cambiarPosicion(String posicion) {
    _pediloYaApp.posicion = posicion;
  }

  bool puedeGuardar(String comida) {
    List listFavorito =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][4];
    if (listFavorito.isEmpty) {
      return true;
    }
    for (int p = 0; p < listFavorito.length; p++) {
      if (listFavorito[p][0] == comida) {
        return false;
      }
    }
    return true;
  }

  int devolverIndex(String comida) {
    List listFavorito =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][4];
    int index = 0;
    for (int p = 0; p < listFavorito.length; p++) {
      if (listFavorito[p][0] == comida) {
        index = p;
      }
    }
    return index;
  }

  bool comidaEstaEnFavoritos(String comida) {
    List listFavorito =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][4];
    for (int p = 0; p < listFavorito.length; p++) {
      if (listFavorito[p][1] == comida) {
        return true;
      }
    }
    return true;
  }

  void guardarComidaAFavoritos(String comida, int precio, String imagen) {
    List bdDeComidaFavorita =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][4];
    bdDeComidaFavorita.add([comida, precio, imagen]);
    _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][4] =
        bdDeComidaFavorita;
  }

  void eliminarComidaAFavoritos(int index) {
    List bdDeComidaFavorita =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][4];

    bdDeComidaFavorita.removeAt(index);
    _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][4] =
        bdDeComidaFavorita;
  }

  void agregarComidaALaLista(String comida, int precio, int cantidad) {
    List newList = [comida, cantidad, precio];
    _pediloYaApp.listaCarrito.add(newList);
    notifyListeners();
  }

  List listaCarrito() {
    return _pediloYaApp.listaCarrito;
  }

  List devolverListaMenu() {
    return _pediloYaApp.listaMenu;
  }

  void borrarPedidos() {
    _pediloYaApp.listaCarrito.clear();
  }

  int posicionBD() {
    return _pediloYaApp.posiciondeListaBaseDeDato;
  }

  void cambiarValorPosicionBD(int p) {
    _pediloYaApp.posiciondeListaBaseDeDato = p;
  }

  String nombreUserNow() {
    return _pediloYaApp.userLoginNow;
  }

  void cambiarTipoDePago(String tipo) {
    _pediloYaApp.tipoDePago = tipo;
  }

  String mostrarTipoDePago() {
    return _pediloYaApp.tipoDePago;
  }

  String mostrarDireccion() {
    _pediloYaApp.adressNow =
        _pediloYaApp.listaAdress[_pediloYaApp.posiciondeListaBaseDeDato];
    return _pediloYaApp.adressNow;
  }

  int cantidadComidaEnELCArrito() {
    _pediloYaApp.cantidadCarrito = _pediloYaApp.listaCarrito.length;
    return _pediloYaApp.listaCarrito.length;
  }

  List listaDeCantidad() {
    return _pediloYaApp.listaPedidoCantidad;
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
    _pediloYaApp.listaCarrito.removeAt(index);
  }

  String verificarLogin(String name, String pass) {
    if (name == '' || pass == '') {
      return 'null';
    }
    for (int p = 0; p < _pediloYaApp.bd.length; p++) {
      if (_pediloYaApp.bd[p][1] == name && _pediloYaApp.bd[p][2] == pass) {
        _pediloYaApp.userLoginNow = _pediloYaApp.bd[p][0];
        cambiarValorPosicionBD(p);
        return 'bien';
      }
    }
    print('LISTA original: ${_pediloYaApp.bd}');
    return 'error';
  }

  void guardarNombreYApellido(String nameUser) {
    _pediloYaApp.userLoginNow = nameUser;
  }

  void guardarDatos(List<dynamic> datos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String datosJson = json.encode(datos);
    prefs.setString('listaBD', datosJson);
  }

  void cargarDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String datosJson = prefs.getString('listaBD') ?? '[]';
    List<dynamic> listaCargada = json.decode(datosJson);
    _pediloYaApp.bd = listaCargada;
    print(_pediloYaApp.bd);
  }

  void guardarNuevoUsuario(
      String userName, String pass, String name, String adress) {
    List<dynamic> newList = [name, userName, pass, adress, [], []];
    _pediloYaApp.bd.add(newList);
    guardarDatos(_pediloYaApp.bd);
  }

  String datosNuevos(String name, String pass1, String pass2) {
    cargarDatos();
    if (pass1 == '' || name == '') {
      return 'null';
    }
    if (pass1 != pass2) {
      return 'c1!=c2';
    }
    for (int p = 0; p < _pediloYaApp.bd.length; p++) {
      if (_pediloYaApp.bd[p][1] == name) {
        return 'u==ou';
      }
    }
    return 'bien';
  }

  int calcularTotal() {
    _pediloYaApp.totalPrecio = 0;
    for (int precio = 0; precio < _pediloYaApp.listaCarrito.length; precio++) {
      int comidaPrecio = _pediloYaApp.listaCarrito[precio][2];
      _pediloYaApp.totalPrecio = _pediloYaApp.totalPrecio + comidaPrecio;
    }
    return _pediloYaApp.totalPrecio;
  }

  List devolverListasTarjetas() {
    return _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][5];
  }

  void agregarNuevaTarjeta(
      String name, int numero, String tipo, String fechaC, String fechaV) {
    List newList = [
      name,
      numero,
      tipo,
      fechaC,
      fechaV,
    ];
    List listaTarjeta =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][5];
    listaTarjeta.add(newList);
    _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][5] = listaTarjeta;
  }

  void eliminarTarjeta(int index) {
    List listaTarjeta =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][5];
    listaTarjeta.removeAt(index);
    _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][5] = listaTarjeta;
  }
}
