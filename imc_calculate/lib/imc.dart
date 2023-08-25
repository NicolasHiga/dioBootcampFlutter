class Imc {
  static double calculateIMC(double weight, double height) {
    double imc = weight / (height * height);
    return imc;
  }

  static String classifyIMC(double imc) {
    if (imc < 16) {
      return "Magreaza grave";
    } else if (imc >= 16 && imc < 17) {
      return "Magreaza moderada";
    } else if (imc >= 17 && imc < 18.5) {
      return "Magreaza leve";
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
