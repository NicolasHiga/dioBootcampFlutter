import 'dart:convert';
import 'dart:io';

class Utils {
  static String validateName(String name) {
    if (name.trim().isEmpty) {
      return "Nome não pode estar vazio.";
    }

    if (name.length < 3) {
      return "Nome deve ter pelo menos 3 caracteres.";
    }

    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(name)) {
      return "Nome deve conter apenas letras e espaços.";
    }

    return "true"; // Nome válido
  }

  static dynamic getDataConsole(String text, bool isNumber) {
    do {
      print(text);
      var data = stdin.readLineSync(encoding: utf8);

      if (isNumber) {
        try {
          double value = double.parse(data!);
          if (value > 0) {
            return value;
          } else {
            print("Valor inválido. Digite novamente.");
          }
        } catch (e) {
          print("Valor inválido. Digite novamente.");
        }
      } else {
        String? validationError = validateName(data!);
        if (validationError != "true") {
          print(validationError);
        } else {
          return data;
        }
      }
    } while (true);
  }
}
