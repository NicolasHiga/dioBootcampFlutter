import 'package:flutter/material.dart';
import 'package:imc_app/models/historicIMC.dart';
import 'package:imc_app/pages/showResults.dart';
import 'package:validatorless/validatorless.dart';

// ignore: must_be_immutable
class CalculatePage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  List<HistoricIMC> previewsImc = [];

  CalculatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculadora IMC',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'IMC',
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'índice de Massa Corporal',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: heightController,
                    decoration: InputDecoration(
                      labelText: 'Altura(m)',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                            10.0), // Cor personalizada da borda
                      ),
                    ),
                    validator: Validatorless.required('Digite uma altura(m)'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: weightController,
                    decoration: InputDecoration(
                      labelText: 'Peso(kg)',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                            10.0), // Cor personalizada da borda
                      ),
                    ),
                    validator: Validatorless.required('Digite um peso(kg)'),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue, // Define a cor de fundo do Container
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Apenas continue se o formulário for válido
                          try {
                            double height =
                                double.tryParse(heightController.text) ?? 0;
                            double weight =
                                double.tryParse(weightController.text) ?? 0;

                            double imc = weight / (height * height);
                            String result = calcularIMC(imc);

                            previewsImc.add(HistoricIMC(
                              height: height,
                              weight: weight,
                              imc: imc,
                              classification: result,
                              date: DateTime.now(),
                            ));

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowResults(
                                  imc: imc,
                                  result: result,
                                  datas: previewsImc,
                                ),
                              ),
                            );

                            // Limpar os campos do formulário
                            heightController.clear();
                            weightController.clear();
                          } catch (e) {
                            print('ERRO: $e');
                            throw Exception('Erro ao calcular IMC');
                          }
                        }
                      },
                      child: const Text(
                        'Calcular',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String calcularIMC(double imc) {
    if (imc < 16) {
      return "Magreza grave";
    } else if (imc >= 16 && imc < 17) {
      return "Magreza moderada";
    } else if (imc >= 17 && imc < 18.5) {
      return "Magreza leve";
    } else if (imc >= 18.5 && imc < 25) {
      return "Saudável";
    } else if (imc >= 25 && imc < 30) {
      return "Sobrepeso";
    } else if (imc >= 30 && imc < 35) {
      return "Obesidade Grau I";
    } else if (imc >= 35 && imc < 40) {
      return "Obesidade Grau II (severa)";
    } else if (imc >= 40) {
      return "Obesidade Grau III (mórbida)";
    } else {
      return "erro";
    }
  }
}
