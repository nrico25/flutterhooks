import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:teamhooks/widget/textfield.dart';
import 'package:go_router/go_router.dart';
import 'logic/logicBangunDatar.dart'; 

class BangunDatar extends HookWidget {
  final String nama;

  const BangunDatar({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {

    final sisiController = useTextEditingController();
    final squareResult = useState<double?>(null);

    final lengthController = useTextEditingController();
    final widthController = useTextEditingController();
    final rectangleResult = useState<double?>(null);

    final baseController = useTextEditingController();
    final heightController = useTextEditingController();
    final triangleResult = useState<double?>(null);

    void onCalculateSquare() {
      final sisi = double.tryParse(sisiController.text);
      squareResult.value = calculateSquareArea(sisi);
    }

    // Calculate area for Rectangle
    void onCalculateRectangle() {
      final length = double.tryParse(lengthController.text);
      final width = double.tryParse(widthController.text);
      rectangleResult.value = calculateRectangleArea(length, width);
    }

    // Calculate area for Triangle
    void onCalculateTriangle() {
      final base = double.tryParse(baseController.text);
      final height = double.tryParse(heightController.text);
      triangleResult.value = calculateTriangleArea(base, height);
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_left),
            onPressed: () {
              context.push('/');
            },
          ),
        ],
        title: Text('Bangun datar - $nama'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
        child: Column(
          children: [
            // Square Area
            Text("Luas Persegi"),
            MyTextField(
              Label: "Masukan Sisi",
              controller: sisiController,
              HintText: "Sisi Persegi",
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onCalculateSquare,
              child: const Text("Hitung Luas Persegi"),
            ),
            const SizedBox(height: 20),
            if (squareResult.value != null)
              Text(
                "Hasil: ${squareResult.value}",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            
            const SizedBox(height: 40),

            // Rectangle Area
            Text("Luas Persegi Panjang"),
            MyTextField(
              Label: "Masukan Panjang",
              controller: lengthController,
              HintText: "Panjang Persegi Panjang",
            ),
            MyTextField(
              Label: "Masukan Lebar",
              controller: widthController,
              HintText: "Lebar Persegi Panjang",
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onCalculateRectangle,
              child: const Text("Hitung Luas Persegi Panjang"),
            ),
            const SizedBox(height: 20),
            if (rectangleResult.value != null)
              Text(
                "Hasil: ${rectangleResult.value}",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

            const SizedBox(height: 40),

            // Triangle Area
            Text("Luas Segitiga"),
            MyTextField(
              Label: "Masukan Alas",
              controller: baseController,
              HintText: "Alas Segitiga",
            ),
            MyTextField(
              Label: "Masukan Tinggi",
              controller: heightController,
              HintText: "Tinggi Segitiga",
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onCalculateTriangle,
              child: const Text("Hitung Luas Segitiga"),
            ),
            const SizedBox(height: 20),
            if (triangleResult.value != null)
              Text(
                "Hasil: ${triangleResult.value}",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
