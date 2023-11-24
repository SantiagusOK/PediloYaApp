import 'package:go_router/go_router.dart';
import 'package:pedilo_ya/page_carrito.dart';
import 'package:pedilo_ya/page_inicio.dart';
import 'package:pedilo_ya/page_menu.dart';

enum Pages { inicio, menu, carrito }

GoRouter ruta =
    GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
  GoRoute(
      name: Pages.inicio.name,
      path: '/',
      builder: (context, state) {
        return const PaginaInicio();
      },
      routes: [
        GoRoute(
          name: Pages.menu.name,
          path: 'menu',
          builder: (context, state) {
            return const PaginaMenu();
          },
        ),
        GoRoute(
          name: Pages.carrito.name,
          path: 'carrito',
          builder: (context, state) {
            return const PaginaCarrito();
          },
        ),
      ])
]);
