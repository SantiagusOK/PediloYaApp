class PediloYaApp {
  List<String> listaPedidoComida = [];
  List<int> listaPedidoPrecio = [];
  int totalPrecio = 0;

  void agregarComidaALaLista(String comida, int precio) {
    listaPedidoComida.add(comida);
    listaPedidoPrecio.add(precio);
  }

  void calcularTotal() {
    for (int precio = 0; precio < listaPedidoPrecio.length; precio++) {
      totalPrecio = totalPrecio + listaPedidoPrecio[precio];
    }
  }
}
