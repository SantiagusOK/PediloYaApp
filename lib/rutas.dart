import 'package:go_router/go_router.dart';
import 'package:pedilo_ya/page_inicio.dart';
import 'package:pedilo_ya/page_login.dart';
import 'package:pedilo_ya/pagina_pantalla.dart';

enum Pages { pageBotones, pageInicio, pageLogin }

GoRouter router =
    GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
  GoRoute(
      name: Pages.pageBotones.name,
      path: '/',
      builder: (context, state) {
        return const PagePantallas();
      },
      routes: [
        GoRoute(
          name: Pages.pageInicio.name,
          path: 'inicio',
          builder: (context, state) {
            return const PageInicio();
          },
        ),
        GoRoute(
          name: Pages.pageLogin.name,
          path: 'login',
          builder: (context, state) {
            return const PageLogin();
          },
        ),
      ])
]);
