import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:teamhooks/widget/myTextField.dart';
import 'package:teamhooks/widget/myButton.dart';
import 'package:teamhooks/logic/aritmathic.dart';
import 'package:go_router/go_router.dart';

class KalkulatorAritmatika extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final number1Controller = useTextEditingController();
    final number2Controller = useTextEditingController();
    final result = useState<String>('');

    void onCalculate(String operation) {
      final num1 = double.tryParse(number1Controller.text);
      final num2 = double.tryParse(number2Controller.text);

      final aritmatika = Aritmatika(number1: num1, number2: num2);
      result.value = aritmatika.calculate(operation);
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
        title: Text('Aritmatika'),
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
