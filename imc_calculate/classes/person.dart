
class Person {
  String? name;
  double? height;
  double? weight;
  double? imc;
  String? classification;

  @override
  String toString() {
    return "Name: $name\nWeight: $weight kg\nHeight: $height meters";
  }
}