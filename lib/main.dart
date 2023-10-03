import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Temperature Converter'),
        ),
        body: TemperatureConverter(),
      ),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double _celsius = 0.0;
  double _fahrenheit = 0.0;

  void _convertCelsiusToFahrenheit() {
    setState(() {
      _fahrenheit = (_celsius * 9 / 5) + 32;
    });
  }

  void _convertFahrenheitToCelsius() {
    setState(() {
      _celsius = (_fahrenheit - 32) * 5 / 9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Celsius to Fahrenheit and Vice Versa'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _celsius = double.tryParse(value) ?? 0.0;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Celsius'),
                ),
              ),
              Text(' = '),
              Container(
                width: 100,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _fahrenheit = double.tryParse(value) ?? 0.0;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Fahrenheit'),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _convertCelsiusToFahrenheit,
            child: Text('Convert to Fahrenheit'),
          ),
          ElevatedButton(
            onPressed: _convertFahrenheitToCelsius,
            child: Text('Convert to Celsius'),
          ),
          SizedBox(height: 20),
          Text('Result:'),
          Text('$_celsius °C = $_fahrenheit °F'),
        ],
      ),
    );
  }
}
