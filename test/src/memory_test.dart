import 'dart:math';

import 'package:calculadora/src/memory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Memory memory;
  late Random random;

  int generateRandomInt({
    totalDigits = 5,
  }) {
    int randomDigit() {
      return random.nextInt(10);
    }

    // Gere o primeiro dígito aleatório de 1 a 9 para garantir que não seja zero.
    final firstDigit = (1 + random.nextInt(9)).toString();

    // Gere os dígitos restantes.
    final remainingDigits =
        List.generate(totalDigits - 1, (index) => randomDigit());

    // Junte o primeiro dígito com os dígitos restantes em uma única string.
    final numberString = firstDigit + remainingDigits.join();

    return int.tryParse(numberString) ?? 0;
  }

  double generateRandomDouble({
    int totalDigits = 5,
    int decimalPlaces = 2,
  }) {
    // Gere uma lista de dígitos aleatórios com o número especificado de dígitos.
    final digits = List.generate(totalDigits, (index) => random.nextInt(10));

    // Insira um ponto decimal na posição desejada (decimalPlaces)
    if (decimalPlaces > 0) {
      digits.insert(totalDigits - decimalPlaces, 0); // Insere um ponto decimal
    }

    // Junte os dígitos em uma única string
    final numberString = digits.join();

    // Converta a string em um número decimal (double)
    final result = double.tryParse(numberString) ?? 0.0;

    return result;
  }

  group(
    'Teste de Memoria',
    () {
      setUp(() {
        memory = Memory();
        random = Random(); //
      });

      test('Memoria dever ser totalmente limpa na inicialização', () {
        expect(memory.result, '0');
      });

      test(
          'Deve ser possível adicionar um dígito ao clicar nos botões numéricos',
          () {
        final initialNumber = generateRandomDouble().toString();

        for (int codePoint in initialNumber.runes) {
          memory.applyCommand(String.fromCharCode(codePoint));
        }

        expect(memory.result, initialNumber);
      });

      test('Testar cálculo de adição', () {
        final num1 = generateRandomInt();
        final num2 = generateRandomInt();
        memory.applyCommand(num1.toString());
        memory.applyCommand('+');
        memory.applyCommand(num2.toString());
        memory.applyCommand('=');
        expect(memory.result, (num1 + num2).toString());
      });

      test('Testar cálculo de subtração', () {
        final num1 = generateRandomInt();
        final num2 = generateRandomInt();
        memory.applyCommand(num1.toString());
        memory.applyCommand('-');
        memory.applyCommand(num2.toString());
        memory.applyCommand('=');
        expect(memory.result, (num1 - num2).toString());
      });

      test('Testar cálculo de multiplicação', () {
        final num1 = generateRandomInt();
        final num2 = generateRandomInt();
        memory.applyCommand(num1.toString());
        memory.applyCommand('x');
        memory.applyCommand(num2.toString());
        memory.applyCommand('=');
        expect(memory.result, (num1 * num2).toString());
      });

      test('Testar cálculo de divisão', () {
        final num1 = random.nextDouble();
        final num2 = random.nextDouble();
        memory.applyCommand(num1.toString());
        memory.applyCommand('÷');
        memory.applyCommand(num2.toString());
        memory.applyCommand('=');
        expect(memory.result, (num1 / num2).toString());
      });

      test('Testar cálculo de porcentagem', () {
        final num1 = generateRandomInt();
        final num2 = random.nextInt(9) + 1;
        memory.applyCommand(num1.toString());
        memory.applyCommand('%');
        memory.applyCommand(num2.toString());
        memory.applyCommand('=');
        expect(memory.result, ((num1 * num2) / 100).toString());
      });

      test('Deve ser possível limpar a memória com o comando AC', () {
        // Gere números aleatórios para testar a limpeza de memória
        var initialNumber = generateRandomInt().toString();

        // memory.applyCommand(initialNumber);
        // expect(memory.result, initialNumber);

        memory.applyCommand('AC');
        expect(memory.result, '0');
      });

      test(
          'Deve ser possível deletar o último dígito em memoria com o comando DEL',
          () {
        // Gere números aleatórios para testar a exclusão de dígitos
        final initialNumber = generateRandomInt().toString();

        memory.applyCommand(initialNumber);
        expect(memory.result, initialNumber);

        // Remova dígitos um por um e verifique o resultado
        for (int i = initialNumber.length - 1; i >= 0; i--) {
          memory.applyCommand('DEL');
          expect(memory.result, i == 0 ? '0' : initialNumber.substring(0, i));
        }
      });
    },
  );
}
