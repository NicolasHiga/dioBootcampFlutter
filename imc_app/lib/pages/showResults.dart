import 'package:flutter/material.dart';
import 'package:imc_app/models/historicIMC.dart';
import 'package:intl/intl.dart';

class ShowResults extends StatelessWidget {
  final double imc;
  final String result;
  final List<HistoricIMC> datas;

  const ShowResults(
      {super.key,
      required this.imc,
      required this.result,
      required this.datas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resultado',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Seu imc é de ${imc.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 26),
                  ),
                  Text(
                    result.toUpperCase(),
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: imc < 17 || imc >= 35
                            ? Colors.red
                            : (imc >= 18.5 && imc < 25)
                                ? Colors.green
                                : Colors.yellow),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Histórico',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 212, 212, 212),
                borderRadius: BorderRadius.circular(10.0), // Borda arredondada
                border: Border.all(
                  color: Colors.grey, // Cor da borda
                  width: 1.0, // Largura da borda
                ),
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Data',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                          child: Text(
                        'Peso',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                          child: Text(
                        'Altura',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                          child: Text(
                        'IMC',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                          child: Text(
                        'Classificação',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                  Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var data in datas)
                          Row(
                            children: [
                              Expanded(
                                  child: Text(DateFormat('dd/MM/yyyy HH:mm')
                                      .format(data.date))),
                              Expanded(
                                  child: Text('${data.weight.toString()} kg')),
                              Expanded(
                                  child: Text('${data.height.toString()} m')),
                              Expanded(
                                  child: Text(data.imc.toStringAsFixed(2))),
                              Expanded(child: Text(data.classification)),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
