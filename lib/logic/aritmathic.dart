class Aritmatika {
  final double? number1;
  final double? number2;

  Aritmatika({required this.number1, required this.number2});

  String calculate(String operation) {
    if (number1 == null || number2 == null) {
      return 'Masukkan angka yang valid';
    }

    switch (operation) {
      case 'add':
        return 'Hasil: ${number1! + number2!}';
      case 'subtract':
        return 'Hasil: ${number1! - number2!}';
      case 'multiply':
        return 'Hasil: ${number1! * number2!}';
      case 'divide':
        if (number2 == 0) {
          return 'Pembagi tidak boleh nol';
        } else {
          return 'Hasil: ${number1! / number2!}';
        }
      default:
        return 'Operasi tidak dikenal';
    }
  }
}
