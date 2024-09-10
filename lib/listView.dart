import 'package:flutter/material.dart';
import 'package:teamhooks/Model/model.dart';
import 'package:teamhooks/component_page/Adapter.dart';
import 'package:go_router/go_router.dart';

class ListViewDashboard extends StatefulWidget {
  const ListViewDashboard({super.key});

  @override
  State<ListViewDashboard> createState() => _ListViewDashboardState();
}

class _ListViewDashboardState extends State<ListViewDashboard> {
  List<Model> dataKalkulator = [
    Model("Aritmatika", "assets/aritmatik.png"),
    Model("Bangun Datar", "assets/circle.png"),
    Model("Bangun Ruang", "assets/cube.png"),
    Model("Perpangkatan", "assets/pangkat.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("List Kalkulator"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,  // Dua item per baris
          childAspectRatio: 0.75, // Mengatur perbandingan gambar dan teks
        ),
        itemCount: dataKalkulator.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _handleTap(context, index);
            },
            child: AdapterList(model: dataKalkulator[index]),
          );
        },
      ),
    );
  }

  void _handleTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/aritmatika');
        break;
      case 1:
        context.go('/bangunDatar');
        break;
      case 2:
        context.go('/bangunRuang');
        break;
      case 3:
        context.go('/perpangkatan');
        break;
      default:
        break;
    }
  }
}
