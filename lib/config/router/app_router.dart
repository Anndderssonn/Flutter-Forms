import 'package:go_router/go_router.dart';
import 'package:flutter_forms/presentation/screens/screens.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/cubits', builder: (context, state) => CubitCounterScreen()),
    GoRoute(path: '/bloc', builder: (context, state) => BlocCounterScreen()),
    GoRoute(path: '/new-user', builder: (context, state) => RegisterScreen()),
  ],
);
