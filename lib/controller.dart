import 'package:conversor_moeda/enums.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'controller.g.dart';

/**
 * ESSE ARQUIVO É O QUE CONTROLA O 'GERENCIMENTO DE ESTADO'
 * O QUE É GERENCIAMENTO DE ESTADO É ALGUMA MUDANCA QUE VC QUER QUE SEU APP FAÇA
 * NESSE CASO, AQUI É AONDE VAI PEGAR O VALOR QUE O USUARIO DIGITAR E CONVERTER PARA DOLLAR
 **/
class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  TypeValor type;
  NumberFormat numFormat = NumberFormat('###.0#', 'pt_BR');


  @observable
  double valor;

  @observable
  String resultado = '0.00';



  String get getType => (type == TypeValor.dollar) ? 'Dollares' : 'Reais';

  @action
  passarValor(String value) {
    valor = double.parse(value);
  }

  @action
  calcularDollar() {
    resultado = numFormat.format(valor / 4.22);
    type = TypeValor.dollar;
  }

  @action
  calculaReal() {
    resultado = numFormat.format(valor * 4.22);
    type = TypeValor.real;
  }
}
