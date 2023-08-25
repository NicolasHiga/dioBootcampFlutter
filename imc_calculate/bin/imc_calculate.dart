import 'package:imc_calculate/imc.dart';
import 'package:imc_calculate/utils.dart';

import '../classes/person.dart';

void main(List<String> arguments) {
  Person currentPerson = Person();
  currentPerson.name =
      Utils.getDataConsole("Bem-vindo. Para começarmos digite o seu nome:", false);
  currentPerson.weight = Utils.getDataConsole("Digite seu peso (kg):", true);
  currentPerson.height = Utils.getDataConsole("Digite sua altura (metros):", true);

  if (currentPerson.weight != null && currentPerson.height != null) {
    currentPerson.imc = Imc.calculateIMC(currentPerson.weight!, currentPerson.height!);
    currentPerson.classification = Imc.classifyIMC(currentPerson.imc!);

    print(
        "\n${currentPerson.name!.toUpperCase()},\nCom os dados fornecidos seu IMC foi de ${currentPerson.imc!.toStringAsFixed(2)}, sendo considerado ${currentPerson.classification!.toUpperCase()}");
  } else {
    print("Valores de peso e/ou altura inválidos.");
  }
}


