import 'package:intl/intl.dart';

class Calc {
  double _peso;
  double _altura;
  double _imc;

  String result = '';
  String image = 'assets/todos.png';

  Calc() {
    clear();
  }

  void clear() {
    result = '';
    image = 'assets/todos.png';

    _peso = 0.0;
    _altura = 0.0;
    _imc = 0.0;
  }

  void _calcIMC() {
    _imc = _peso / (_altura * _altura);

    if (_imc < 20.7) {
      image = 'assets/1.png';
    } else if (_imc >= 20.7 && _imc < 26.4) {
      image = 'assets/2.png';
    } else if (_imc >= 26.4 && _imc < 27.8) {
      image = 'assets/3.png';
    } else if (_imc >= 27.8 && _imc < 31.1) {
      image = 'assets/4.png';
    } else {
      image = 'assets/5.png';
    }

    result = 'Seu IMC é ' + NumberFormat.decimalPattern('pt_BR').format(_imc);
  }

  void execButton(String altura, String peso) {
    _altura = double.tryParse(altura.replaceAll(',', '.'));
    _peso = double.tryParse(peso.replaceAll(',', '.'));

    if (_altura > 0 && _peso > 0) {
      _calcIMC();
    } else {
      result = 'Preencha todos os dados corretamente';
      image = 'assets/todos.png';
    }

    print(altura);
    print(peso);
    print(image);
  }
}
