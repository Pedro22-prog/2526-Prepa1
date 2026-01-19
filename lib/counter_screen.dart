import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador basico'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                contador = 0;
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$contador',
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              (contador == 1) ? 'Click' : 'Clicks',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.plus_one,
            entrada: () {
              contador++;
              setState(() {});
            },
          ),
          const SizedBox(height: 5),
          CustomButton(
            icon: Icons.exposure_minus_1,
            entrada: () {
              if (contador == 0) return;
              contador--;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? entrada;

  const CustomButton({super.key, required this.icon, this.entrada});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(shape: const StadiumBorder(),enableFeedback: true,onPressed: entrada, child: Icon(icon));
  }
}
