import 'package:go_router/go_router.dart';
import 'package:pedilo_ya/page_inicio.dart';
import 'package:pedilo_ya/page_login.dart';
import 'package:pedilo_ya/page_menu.dart';

enum Pages { pageBotones, pageInicio, pageLogin, pageMenu }

GoRouter router =
    GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
  GoRoute(
      name: Pages.pageInicio.name,
      path: '/',
      builder: (context, state) {
        return const PageInicio();
      },
      routes: [
        GoRoute(
          name: Pages.pageLogin.name,
          path: 'login',
          builder: (context, state) {
            return const PageLogin();
          },
        ),
        GoRoute(
            name: Pages.pageMenu.name,
            path: 'menu',
            builder: (context, state) {
              return const PageMenu();
            })
      ])
]);
