import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:teamhooks/widget/textField.dart';
import 'package:go_router/go_router.dart';
import 'logic/logicPangkat.dart'; 

class Perpangkatan extends HookWidget {
  final String nama;

  const Perpangkatan({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    final _numberController = useTextEditingController();
    final _pangkatController = useTextEditingController();
    final result = useState<double?>(null);

    void onCalculatePressed() {
      // Parsing the input numbers from the TextFields
      final number = double.tryParse(_numberController.text);
      final exponent = double.tryParse(_pangkatController.text);

      // Calculate the power using the imported function and update the result state
      result.value = calculatePower(number, exponent);
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
        title: Text('Perpangkatan - $nama'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: MyTextField(
                Label: "Masukan bilangan Pokok",
                controller: _numberController,
                HintText: "Bilangan pokok",
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: MyTextField(
                Label: "Masukan bilangan Pangkat",
                controller: _pangkatController,
                HintText: "Bilangan Pangkat",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onCalculatePressed,
              child: const Text("Hitung"),
            ),
            const SizedBox(height: 20),
            if (result.value != null)
              Text(
                "Hasil: ${result.value}",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
