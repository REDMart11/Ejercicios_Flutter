import 'package:flutter/material.dart';

void main() {
  runApp(OperacionesMatematicasApp());
}

class OperacionesMatematicasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Operaciones Matemáticas',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NumeroMayorPage(),
    );
  }
}

class NumeroMayorPage extends StatefulWidget {
  @override
  _NumeroMayorPageState createState() => _NumeroMayorPageState();
}

class _NumeroMayorPageState extends State<NumeroMayorPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _num3Controller = TextEditingController();

  String _resultado = '';

  void _calcularNumeroMayor() {
    try {
      final num1 = double.parse(_num1Controller.text);
      final num2 = double.parse(_num2Controller.text);
      final num3 = double.parse(_num3Controller.text);

      final mayor = [num1, num2, num3].reduce((a, b) => a > b ? a : b);

      setState(() {
        _resultado = 'El número mayor es: $mayor';
      });
    } catch (e) {
      setState(() {
        _resultado = 'Por favor, ingresa números válidos.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Número Mayor'),
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
                'Encuentra el Número Mayor',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
              SizedBox(height: 20),
              _buildNumberInputField(
                  controller: _num1Controller, label: 'Número 1'),
              SizedBox(height: 15),
              _buildNumberInputField(
                  controller: _num2Controller, label: 'Número 2'),
              SizedBox(height: 15),
              _buildNumberInputField(
                  controller: _num3Controller, label: 'Número 3'),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _calcularNumeroMayor,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Calcular Mayor',
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
