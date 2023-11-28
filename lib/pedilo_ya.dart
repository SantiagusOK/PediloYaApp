class PediloYaApp {
  String userLoginNow = '';
  String adressNow = '';
  List<String> listaPedidoComida = [];
  //cosas
  List<String> listaMenuComida = [
    'Lomo',
    'Milanesa Napolitana',
    'Hamburguesa',
    'Pizza Muzzarella',
    'Papas Fritas',
    'Choripan',
    'Empandas Fritas',
    'Sorrentinos: Jamon y Queso',
    'Pancho',
  ];
  List<double> listaMenuPrecio = [
    3300,
    3300,
    2800,
    2700,
    2400,
    2700,
    3600,
    3400,
    2300,
  ];
  List<String> listaMenuImagenComida = [
    'assets/lomo.jpg',
    'assets/mila_napo.jpg',
    'assets/hamburguesa.jpg',
    'assets/pizza_muzza.jpg',
    'assets/papas_fritas.jpg',
    'assets/choripan.jpg',
    'assets/empanadas_fritas.jpg',
    'assets/sorrentinos_jamon_queso.jpg',
    'assets/pancho.jpg',
  ];
  //cosas
  List<String> listaAdress = [' P Sherman calle Wallaby 42 Sidney'];
  List<String> listaNombreYApellido = ['Admin'];
  List<String> listaUserName = ['user123'];
  List<String> listaPassUser = ['user123'];
  List<double> listaPedidoPrecio = [];
  List<int> listaPedidoCantidad = [];
  List<String> listaDatosComprobante = [
    'Pedido de: Agustin Zapata',
    'Tipo de pago: Efectivo',
    'Direccion: Valerio Furlan Manzana B casa 10 San Carlos - La Consulta'
  ];
  double totalPrecio = 0;
  int cantidadCarrito = 0;
  String imagenPizzaNapolitana = "assets/pizza_napolitana.jpg";
  String imagenPancho = "assets/pancho.jpg";
  String imagenNada = "assets/pancho.jpg";
}
