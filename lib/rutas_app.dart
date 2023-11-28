import 'package:go_router/go_router.dart';
import 'package:pedilo_ya/page_carrito.dart';
import 'package:pedilo_ya/page_final.dart';
import 'package:pedilo_ya/page_inicio.dart';
import 'package:pedilo_ya/page_login.dart';
import 'package:pedilo_ya/page_menu.dart';
import 'package:pedilo_ya/page_register.dart';
import 'package:pedilo_ya/page_resultado.dart';
import 'package:pedilo_ya/page_welcome.dart';

enum Pages { inicio, register, login, welcome, menu, carrito, resultado, fin }

GoRouter ruta = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
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
        GoRoute(
          name: Pages.resultado.name,
          path: 'resultado',
          builder: (context, state) {
            return const PaginaResultado();
          },
        ),
        GoRoute(
          name: Pages.fin.name,
          path: 'final',
          builder: (context, state) {
            return const PaginaFinal();
          },
        ),
        GoRoute(
          name: Pages.register.name,
          path: 'register',
          builder: (context, state) {
            return const PaginaRegistro();
          },
        ),
        GoRoute(
          name: Pages.login.name,
          path: 'login',
          builder: (context, state) {
            return const PaginaLogin();
          },
        ),
        GoRoute(
          name: Pages.welcome.name,
          path: 'welcome',
          builder: (context, state) {
            return const PaginaWelcome();
          },
        ),
      ],
    )
  ],
);
