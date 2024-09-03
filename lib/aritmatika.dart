import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:teamhooks/widget/myTextField.dart'; 
import 'package:teamhooks/widget/myButton.dart'; 

class KalkulatorAritmatika extends HookWidget {
  @override
  Widget build(BuildContext context) {

    final number1Controller = useTextEditingController();
    final number2Controller = useTextEditingController();
    final result = useState<String>('');

    void onCalculate(String operation) {
      final num1 = double.tryParse(number1Controller.text);
      final num2 = double.tryParse(number2Controller.text);

      if (num1 == null || num2 == null) {
        result.value = 'Masukkan angka yang valid';
        return;
      }

      switch (operation) {
        case 'add':
          result.value = 'Hasil: ${num1 + num2}';
          break;
        case 'subtract':
          result.value = 'Hasil: ${num1 - num2}';
          break;
        case 'multiply':
          result.value = 'Hasil: ${num1 * num2}';
          break;
        case 'divide':
          if (num2 == 0) {
            result.value = 'Pembagi tidak boleh nol';
          } else {
            result.value = 'Hasil: ${num1 / num2}';
          }
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Aritmatika'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextField(
              label: "Masukkan Angka 1",
              controller: number1Controller,
              hintText: "Angka 1",
            ),
            const SizedBox(height: 20),
            MyTextField(
              label: "Masukkan Angka 2",
              controller: number2Controller,
              hintText: "Angka 2",
            ),
            const SizedBox(height: 20),
            MyButton(
              onPressed: () => onCalculate('add'),
              text: "Tambah",
            ),
            const SizedBox(height: 10),
            MyButton(
              onPressed: () => onCalculate('subtract'),
              text: "Kurang",
            ),
            const SizedBox(height: 10),
            MyButton(
              onPressed: () => onCalculate('multiply'),
              text: "Kali",
            ),
            const SizedBox(height: 10),
            MyButton(
              onPressed: () => onCalculate('divide'),
              text: "Bagi",
            ),
            const SizedBox(height: 20),
            Text(
              result.value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
