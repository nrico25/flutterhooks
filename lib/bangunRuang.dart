import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:teamhooks/widget/myTextField.dart'; 
import 'package:teamhooks/widget/myButton.dart'; 
import 'package:teamhooks/logic/geometric.dart'; 
import 'package:go_router/go_router.dart';


class BangunRuang extends HookWidget {
  final String nama;

  const BangunRuang({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    final sisiController = useTextEditingController();
    final cubeResult = useState<double?>(null);

    final lengthController = useTextEditingController();
    final widthController = useTextEditingController();
    final heightController = useTextEditingController();
    final rectangularPrismResult = useState<double?>(null);

    final radiusController = useTextEditingController();
    final sphereResult = useState<double?>(null);

    final cylinderRadiusController = useTextEditingController();
    final cylinderHeightController = useTextEditingController();
    final cylinderResult = useState<double?>(null);

    void onCalculateCube() {
      final sisi = double.tryParse(sisiController.text);
      cubeResult.value = Geometric.calculateCubeVolume(sisi);
    }

    void onCalculateRectangularPrism() {
      final length = double.tryParse(lengthController.text);
      final width = double.tryParse(widthController.text);
      final height = double.tryParse(heightController.text);
      rectangularPrismResult.value = Geometric.calculateRectangularPrismVolume(length, width, height);
    }

    void onCalculateSphere() {
      final radius = double.tryParse(radiusController.text);
      sphereResult.value = Geometric.calculateSphereVolume(radius);
    }

    void onCalculateCylinder() {
      final radius = double.tryParse(cylinderRadiusController.text);
      final height = double.tryParse(cylinderHeightController.text);
      cylinderResult.value = Geometric.calculateCylinderVolume(radius, height);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text("Volume Kubus"),
            MyTextField(
              label: "Masukkan Sisi",
              controller: sisiController,
              hintText: "Sisi Kubus",
            ),
            const SizedBox(height: 20),
            MyButton(
              onPressed: onCalculateCube,
              text: "Hitung Volume Kubus",
            ),
            const SizedBox(height: 20),
            if (cubeResult.value != null)
              Text(
                "Hasil: ${cubeResult.value}",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

            const SizedBox(height: 40),

            
            Text("Volume Balok"),
            MyTextField(
              label: "Masukkan Panjang",
              controller: lengthController,
              hintText: "Panjang Balok",
            ),
            MyTextField(
              label: "Masukkan Lebar",
              controller: widthController,
              hintText: "Lebar Balok",
            ),
            MyTextField(
              label: "Masukkan Tinggi",
              controller: heightController,
              hintText: "Tinggi Balok",
            ),
            const SizedBox(height: 20),
            MyButton(
              onPressed: onCalculateRectangularPrism,
              text: "Hitung Volume Balok",
            ),
            const SizedBox(height: 20),
            if (rectangularPrismResult.value != null)
              Text(
                "Hasil: ${rectangularPrismResult.value}",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

            const SizedBox(height: 40),

            
            Text("Volume Bola"),
            MyTextField(
              label: "Masukkan Jari-Jari",
              controller: radiusController,
              hintText: "Jari-Jari Bola",
            ),
            const SizedBox(height: 20),
            MyButton(
              onPressed: onCalculateSphere,
              text: "Hitung Volume Bola",
            ),
            const SizedBox(height: 20),
            if (sphereResult.value != null)
              Text(
                "Hasil: ${sphereResult.value}",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

            const SizedBox(height: 40),

            
            Text("Volume Silinder"),
            MyTextField(
              label: "Masukkan Jari-Jari",
              controller: cylinderRadiusController,
              hintText: "Jari-Jari Silinder",
            ),
            MyTextField(
              label: "Masukkan Tinggi",
              controller: cylinderHeightController,
              hintText: "Tinggi Silinder",
            ),
            const SizedBox(height: 20),
            MyButton(
              onPressed: onCalculateCylinder,
              text: "Hitung Volume Silinder",
            ),
            const SizedBox(height: 20),
            if (cylinderResult.value != null)
              Text(
                "Hasil: ${cylinderResult.value}",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
