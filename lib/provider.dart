import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pedilo_ya/pedilo_ya.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatosProvider extends ChangeNotifier {
  final PediloYaApp _pediloYaApp = PediloYaApp();
  PediloYaApp get pediloYaApp => _pediloYaApp;

  //FUNCIONES
  List listaFavoritos() {
    List listFavorito =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][4];
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
    guardarDatos(_pediloYaApp.bd);
  }

  void eliminarComidaAFavoritos(int index) {
    List bdDeComidaFavorita =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][4];

    bdDeComidaFavorita.removeAt(index);
    _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][4] =
        bdDeComidaFavorita;
    guardarDatos(_pediloYaApp.bd);
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
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][3];

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
        _pediloYaApp.adressNow = _pediloYaApp.bd[p][3];
        cambiarValorPosicionBD(p);
        return 'bien';
      }
    }
    return 'error';
  }

  void guardarNombreYApellido(String nameUser) {
    _pediloYaApp.userLoginNow = nameUser;
  }

  void guardarDatos(List<dynamic> datos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String datosJson = json.encode(datos);
    prefs.setString('baseDatos', datosJson);
  }

  void cargarDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String datosJson = prefs.getString('baseDatos') ?? '[]';
    List<dynamic> listaCargada = json.decode(datosJson);
    _pediloYaApp.bd = listaCargada;
  }

  void guardarNuevoUsuario(
      String userName, String pass, String name, String adress) {
    List<dynamic> newList = [name, userName, pass, adress, [], [], []];
    _pediloYaApp.bd.add(newList);
    guardarDatos(_pediloYaApp.bd);
  }

  void borrarDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('baseDatos');
  }

  String datosNuevos(String name, String pass1, String pass2) {
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
      String name, String numero, String tipo, int fechaMes, int fechaYear) {
    List newList = [
      name,
      numero,
      tipo,
      fechaMes,
      fechaYear,
    ];
    List listaTarjeta =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][5];
    listaTarjeta.add(newList);
    _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][5] = listaTarjeta;
    guardarDatos(_pediloYaApp.bd);
  }

  void eliminarTarjeta(int index) {
    List listaTarjeta =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][5];
    listaTarjeta.removeAt(index);
    _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][5] = listaTarjeta;
    guardarDatos(_pediloYaApp.bd);
  }

  String verificarDatosTarjetas(
      String tarjNum, String fechaMes, String fechaYear, String nombre) {
    List listTarjetasUser =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][5];
    if (tarjNum == '' || fechaMes == '' || fechaYear == '' || nombre == '') {
      return 'vacio';
    }
    //verifica si los numeros de la tarjeta ya estan registados en la base de datos del usuario
    for (int posicion = 0; posicion < listTarjetasUser.length; posicion++) {
      if (listTarjetasUser[posicion][1] == tarjNum) {
        return 'misma tarjeta';
      }
    }
    //verifica si los meses estan bien colocados
    int fechaM = int.parse(fechaMes);
    if (fechaM < 1 || fechaM > 12) {
      return 'mal fecha mes';
    }
    //verifica si los años estan bien colocados
    int fechaY = int.parse(fechaYear);
    if (fechaY <= 23) {
      return 'mal fecha año1';
      //return 'Tarjeta vencida, o año mal puesta';
    } else if (fechaY > 30) {
      return 'mal fecha año2';
      //return 'Ingrese bien el año de cierra de la tarjeta';
    }
    //si todo esta bien, devuelve un mensaje de 'bien'
    return 'bien';
  }

  List<dynamic> devolverListaComprobanteDatos() {
    List<dynamic> list = [
      ['Pedido a nombre de:', _pediloYaApp.userLoginNow],
      ['Tipo de pago:', devolverListaCarritoSave()[0][3]],
      ['Direccion:', _pediloYaApp.adressNow]
    ];
    return list;
  }

  void guardarComidaASaved() {
    List lista1 = [];
    for (int a = 0; a < _pediloYaApp.listaCarrito.length; a++) {
      lista1.add(_pediloYaApp.listaCarrito[a]);
    }
    List lista2 = lista1[0];
    lista2.add(_pediloYaApp.tipoDePago);
    lista1[0] = lista2;
    _pediloYaApp.listaCarritosave = lista1;
  }

  List<dynamic> devolverListaCarritoSave() {
    return _pediloYaApp.listaCarritosave;
  }

  void guardarComidaAMisCompras() {
    List listabdMisCompras =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][6];
    listabdMisCompras.add(_pediloYaApp.listaCarritosave);
    _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][6] =
        listabdMisCompras;
    guardarDatos(_pediloYaApp.bd);
  }

  List devolverListaMisCompras() {
    return _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][6];
  }

  List<dynamic> devolverListaComprados(int index) {
    List<dynamic> list1 =
        _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][6];
    List<dynamic> listaComidaComprada = list1[index];
    return listaComidaComprada;
  }

  List devolverBd() {
    return _pediloYaApp.bd;
  }

  List listaCarritoSaved() {
    return _pediloYaApp.listaCarritosave;
  }

  int calcularTotalListaCarritoSave() {
    int total = 0;
    for (int a = 0; a < _pediloYaApp.listaCarritosave.length; a++) {
      int precioComida = _pediloYaApp.listaCarritosave[a][2];
      total = total + precioComida;
    }
    return total;
  }

  void actualizarComida(int index) {
    List list1 = _pediloYaApp.bd[_pediloYaApp.posiciondeListaBaseDeDato][6];
    _pediloYaApp.listaCarritosave = list1[index];
  }

  void vaciarListaCarritoSaved() {
    _pediloYaApp.listaCarritosave.clear();
  }
}
