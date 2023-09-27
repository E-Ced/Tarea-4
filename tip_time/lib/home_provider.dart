import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  double _recibo = 0.0;
  double get getRecibo => _recibo;
  void setRecibo(text) {
    var i = double.parse(text);
    _recibo = i;
    notifyListeners();
  }

  double _porcentaje = 0.0;
  double get getPorcentaje => _porcentaje;
  void setPorcentaje(porcentaje) {
    _porcentaje = porcentaje;
    notifyListeners();
  }

  bool _rTip = false;
  bool get getRTip => _rTip;
  void setRTip(round) {
    _rTip = round;
    notifyListeners();
  }

  double _cuentaFinal = 0.0;
  double get getCuentaFinal => _cuentaFinal;
  void setCuentaFinal(cuentaFinal) {
    _cuentaFinal = cuentaFinal;
  }

  void calcularCuenta() {
    if (getRTip == true) {
      setCuentaFinal((getRecibo * getPorcentaje).roundToDouble());
      notifyListeners();
    } else {
      setCuentaFinal(getRecibo * getPorcentaje);
      notifyListeners();
    }
  }
}
