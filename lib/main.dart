import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  void buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        output = "0";
        num1 = 0;
        num2 = 0;
        operand = "";
      } else if (value == "+" ||
          value == "-" ||
          value == "×" ||
          value == "÷") {
        num1 = double.parse(output);
        operand = value;
        output = "0";
      } else if (value == "=") {
        num2 = double.parse(output);

        if (operand == "+") {
          output = (num1 + num2).toString();
        } else if (operand == "-") {
          output = (num1 - num2).toString();
        } else if (operand == "×") {
          output = (num1 * num2).toString();
        } else if (operand == "÷") {
          output = (num1 / num2).toString();
        }
      } else {
        if (output == "0") {
          output = value;
        } else {
          output += value;
        }
      }
    });
  }

  Widget calcButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () => buttonPressed(text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 28),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                output,
                style: const TextStyle(fontSize: 48),
              ),
            ),
          ),

          Row(
            children: [
              calcButton("7"),
              calcButton("8"),
              calcButton("9"),
              calcButton("÷"),
            ],
          ),

          Row(
            children: [
              calcButton("4"),
              calcButton("5"),
              calcButton("6"),
              calcButton("×"),
            ],
          ),

          Row(
            children: [
              calcButton("1"),
              calcButton("2"),
              calcButton("3"),
              calcButton("-"),
            ],
          ),

          Row(
            children: [
              calcButton("C"),
              calcButton("0"),
              calcButton("="),
              calcButton("+"),
            ],
          ),
        ],
      ),
    );
  }
}
