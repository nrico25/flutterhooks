import 'package:flutter/material.dart';
import 'package:teamhooks/Model/model.dart';

class AdapterList extends StatelessWidget {
  final Model model;
  const AdapterList({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(
            model.image,
            fit: BoxFit.contain, 
            width: 100, 
            height: 100,
          ),
          const SizedBox(height: 8),
          Text(
            model.nama,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
