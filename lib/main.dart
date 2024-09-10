import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teamhooks/bangundatar.dart';
import 'package:teamhooks/perpangkatan.dart';
import 'package:teamhooks/aritmatika.dart';
import 'package:teamhooks/bangunRuang.dart';
import 'package:teamhooks/listView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',  
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const ListViewDashboard(),
    ),
    GoRoute(
      path: '/aritmatika',
      builder: (context, state) => KalkulatorAritmatika(),
    ),
    GoRoute(
      path: '/bangunDatar',
      builder: (context, state) => const BangunDatar(nama: 'Bangun Datar'),
    ),
    GoRoute(
      path: '/bangunRuang',
      builder: (context, state) => const BangunRuang(nama: 'Bangun Ruang'),
    ),
    GoRoute(
      path: '/perpangkatan',
      builder: (context, state) => const Perpangkatan(nama: 'Perpangkatan'),
    ),
  ],
);
