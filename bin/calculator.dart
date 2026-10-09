import 'dart:io';
import 'package:calculator/calculator.dart';

void main() {
  final calculator = Calculator();

  print('=================================');
  print('   🧮 Dart Calculator v1.0');
  print('=================================');

  while (true) {
    print('\nSelect an operation:');
    print('1. Addition (+)');
    print('2. Subtraction (-)');
    print('3. Multiplication (*)');
    print('4. Division (/)');
    print('5. Modulo (%)');
    print('6. Exit');
    print('---------------------------------');

    stdout.write('Enter your choice (1-6): ');
    String? choice = stdin.readLineSync();

    if (choice == '6') {
      print('\n👋 Goodbye!');
      break;
    }

    if (choice == null || !['1', '2', '3', '4', '5'].contains(choice)) {
      print('❌ Invalid choice.');
      continue;
    }

    stdout.write('Enter first number: ');
    double? num1 = double.tryParse(stdin.readLineSync() ?? '');
    if (num1 == null) {
      print('❌ Invalid number.');
      continue;
    }

    stdout.write('Enter second number: ');
    double? num2 = double.tryParse(stdin.readLineSync() ?? '');
    if (num2 == null) {
      print(' Invalid number.');
      continue;
    }

    double result;
    String operator;

    switch (choice) {
      case '1':
        result = calculator.add(num1, num2);
        operator = '+';
        break;
      case '2':
        result = calculator.subtract(num1, num2);
        operator = '-';
        break;
      case '3':
        result = calculator.multiply(num1, num2);
        operator = '*';
        break;
      case '4':
        try {
          result = calculator.divide(num1, num2);
        } catch (e) {
          print('❌ $e');
          continue;
        }
        operator = '/';
        break;
      case '5':
        try {
          result = calculator.modulo(num1, num2);
        } catch (e) {
          print('❌ $e');
          continue;
        }
        operator = '%';
        break;
      default:
        continue;
    }

    print('\n✅ Result: $num1 $operator $num2 = $result');
  }
}
