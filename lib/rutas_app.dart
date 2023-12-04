import 'package:go_router/go_router.dart';
import 'package:pedilo_ya/page_bye.dart';
import 'package:pedilo_ya/page_carrito.dart';
import 'package:pedilo_ya/page_comidedit.dart';
import 'package:pedilo_ya/page_compras.dart';
import 'package:pedilo_ya/page_comprobante.dart';
import 'package:pedilo_ya/page_favorito.dart';
import 'package:pedilo_ya/page_final.dart';
import 'package:pedilo_ya/page_inicio.dart';
import 'package:pedilo_ya/page_login.dart';
import 'package:pedilo_ya/page_menu.dart';
import 'package:pedilo_ya/page_register.dart';
import 'package:pedilo_ya/page_resultado.dart';
import 'package:pedilo_ya/page_tarjetaedit.dart';
import 'package:pedilo_ya/page_tarjetas.dart';
import 'package:pedilo_ya/page_welcome.dart';

enum Pages {
  inicio,
  register,
  login,
  welcome,
  goodbye,
  tarjeta,
  menu,
  edit,
  favorito,
  carrito,
  resultado,
  fin,
  tarjetaEdit,
  comprobante,
  compras
}

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
        GoRoute(
          name: Pages.goodbye.name,
          path: 'goodby',
          builder: (context, state) {
            return const PaginaBye();
          },
        ),
        GoRoute(
          name: Pages.favorito.name,
          path: 'favorito',
          builder: (context, state) {
            return const PaginaFavorito();
          },
        ),
        GoRoute(
          name: Pages.edit.name,
          path: 'edit',
          builder: (context, state) {
            return const PaginaComidaEdit();
          },
        ),
        GoRoute(
          name: Pages.tarjeta.name,
          path: 'tarjetas',
          builder: (context, state) {
            return const PaginaTarjetas();
          },
        ),
        GoRoute(
          name: Pages.tarjetaEdit.name,
          path: 'tarjetaEdit',
          builder: (context, state) {
            return const PaginaTarjetaEdit();
          },
        ),
        GoRoute(
          name: Pages.comprobante.name,
          path: 'comprobante',
          builder: (context, state) {
            return const PaginaComprobante();
          },
        ),
        GoRoute(
          name: Pages.compras.name,
          path: 'compras',
          builder: (context, state) {
            return const PaginaCompras();
          },
        ),
      ],
    )
  ],
);
