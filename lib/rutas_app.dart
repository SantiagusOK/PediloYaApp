import 'package:go_router/go_router.dart';
import 'package:pedilo_ya/page_inicio.dart';
import 'package:pedilo_ya/page_menu.dart';

enum Pages { inicio, menu }

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
          path: 'ejLayoutBuilder',
          builder: (context, state) {
            return const PaginaMenu();
          },
        ),
      ])
]);
