class PediloYaApp {
  String userLoginNow = '';
  String adressNow = '';
  String tipoDePago = '';
  //cosas
  List<dynamic> listaCarrito = [];
  List<dynamic> bd = [
    [
      'admin',
      'user123',
      'user123',
      'P Sherman calle Wallaby 42 Sidney',
      [],
      [],
    ],
  ];
  List<dynamic> listaMenu = [
    ['Lomito', 3300, 'assets/lomo.jpg'],
    ['Milanesa Napolitana', 3200, 'assets/mila_napo.jpg'],
    ['Hamburguesa', 2800, 'assets/hamburguesa.jpg'],
    ['Pizza Muzzarella', 2700, 'assets/pizza_muzza.jpg'],
    ['Papas Fritas', 2400, 'assets/papas_fritas.jpg'],
    ['Choripan', 2700, 'assets/choripan.jpg'],
    ['Empanadas Fritas', 3600, 'assets/empanadas_fritas.jpg'],
    ['Sorrentinos: Jamon y Queso', 3400, 'assets/sorrentinos_jamon_queso.jpg'],
    ['Pancho', 2300, 'assets/pancho.jpg']
  ];
  //cosas
  List<String> listaAdress = [' P Sherman calle Wallaby 42 Sidney'];
  List<String> listaNombreYApellido = ['Admin'];
  List<String> listaUserName = ['user123'];
  List<String> listaPassUser = ['user123'];
  int posiciondeListaBaseDeDato = 0;
  List<int> listaPedidoCantidad = [];
  int totalPrecio = 0;
  int cantidadCarrito = 0;
  String posicion = '';

  String comidaElegida = '';
  int comidaPrecioElegida = 0;
  String comidaImagenElegida = '';
}
