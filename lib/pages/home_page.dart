import 'package:best_fuel/utility/default_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controllerAlcohol = TextEditingController();
  final TextEditingController _controllerGasoline = TextEditingController();

  var result = "Resultado";

  void _calculateFuelValue() {
    var valueAlcohol =
        double.tryParse(_controllerAlcohol.text.replaceAll(',', '.'));
    var valueGasoline =
        double.tryParse(_controllerGasoline.text.replaceAll(',', '.'));

    if (valueGasoline == null || valueAlcohol == null) {
      setState(() {
        result = "Não foi possivel calcular com o valor inserido...";
      });
    } else if ((valueAlcohol / valueGasoline) >= 0.7) {
      setState(() {
        result = "Melhor Gasolina!!!";
      });
    } else {
      setState(() {
        result = "Melhor Alcool!!!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Image.asset("assets/images/logo.png"),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              "Saiba qual a melhor opção para abastecimento do seu carro.",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              label: Text("Preço Alcool, ex: 1.59"),
            ),
            keyboardType: TextInputType.number,
            controller: _controllerAlcohol,
          ),
          TextField(
            decoration: const InputDecoration(
              label: Text("Preço Gasolina, ex: 3.59"),
              hoverColor: Color(0xffB4B9D9),
            ),
            keyboardType: TextInputType.number,
            controller: _controllerGasoline,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: _calculateFuelValue,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    DefaultColor.getcolorDefault),
                minimumSize: MaterialStateProperty.all(const Size(200, 50)),
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              child: const Text(
                "Calcular",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              result,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
