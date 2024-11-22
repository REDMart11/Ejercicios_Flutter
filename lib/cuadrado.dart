import 'package:flutter/material.dart';

void main() {
  runApp(CuadradoApp());
}

class CuadradoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calcular Cuadrado',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalcularCuadradoPage(),
    );
  }
}

class CalcularCuadradoPage extends StatefulWidget {
  @override
  _CalcularCuadradoPageState createState() => _CalcularCuadradoPageState();
}

class _CalcularCuadradoPageState extends State<CalcularCuadradoPage> {
  final TextEditingController _numController = TextEditingController();

  String _resultado = '';

  void _calcularCuadrado() {
    final numText = _numController.text;

    if (numText.isEmpty) {
      setState(() {
        _resultado = 'Por favor, ingresa un número.';
      });
      return;
    }

    try {
      final numero = double.parse(numText);
      final cuadrado = numero * numero;

      setState(() {
        _resultado = 'El cuadrado de $numero es: $cuadrado';
      });
    } catch (e) {
      setState(() {
        _resultado = 'Por favor, ingresa un número válido.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcular Cuadrado'),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Calcula el Cuadrado de un Número',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
              SizedBox(height: 20),
              _buildNumberInputField(controller: _numController, label: 'Número'),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _calcularCuadrado,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Calcular Cuadrado',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 30),
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.green.shade900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberInputField(
      {required TextEditingController controller, required String label}) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.green.shade700),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green.shade700, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: Colors.green.shade50,
      ),
    );
  }
}
