class PediloYaApp {
  String userLoginNow = '';
  String adressNow = '';
  String tipoDePago = '';
  //cosas
  List<dynamic> listaCarrito = [];
  List<dynamic> listaCarritosave = [];
  List<dynamic> bd = [
    [],
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
  /*List<dynamic> listaMenu = [
    ['Lomito', 10, 'assets/lomo.jpg'],
    ['Milanesa Napolitana', 5, 'assets/mila_napo.jpg'],
    ['Hamburguesa', 2, 'assets/hamburguesa.jpg'],
    ['Pizza Muzzarella', 8, 'assets/pizza_muzza.jpg'],
    ['Papas Fritas', 3, 'assets/papas_fritas.jpg'],
    ['Choripan', 7, 'assets/choripan.jpg'],
    ['Empanadas Fritas', 5, 'assets/empanadas_fritas.jpg'],
    ['Sorrentinos: Jamon y Queso', 10, 'assets/sorrentinos_jamon_queso.jpg'],
    ['Pancho', 3, 'assets/pancho.jpg']
  ];*/
  //cosas
  int posiciondeListaBaseDeDato = 0;
  List<int> listaPedidoCantidad = [];
  int totalPrecio = 0;
  int cantidadCarrito = 0;
  String posicion = '';

  String comidaElegida = '';
  int comidaPrecioElegida = 0;
  String comidaImagenElegida = '';
}
