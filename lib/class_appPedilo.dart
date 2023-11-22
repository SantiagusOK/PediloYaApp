class Comida {
  String comidaName;
  int comidaPrecio;
  Comida({required this.comidaName, required this.comidaPrecio});
  @override
  String toString() {
    return "$comidaName    -   $comidaPrecio";
  }
}

class Pedido {
  List<Comida> PedidoComida = [];

  void guardarComidaAListaComida(Comida comida) {
    PedidoComida.add(comida);
    for (int p = 0; p < PedidoComida.length; p++) {
      print(PedidoComida[p]);
    }
  }
}
