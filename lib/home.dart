import 'package:flutter/material.dart';
import 'controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Container(
          padding: EdgeInsets.only(
            top: 70,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                onSubmitted: controller.passarValor,
                decoration: InputDecoration(
                  labelText: 'Digite o valor',
                  labelStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                  prefix: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Text('R\$'),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),

              // NOTE botoes
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // NOTE
                    Observer(
                      builder: (_) {
                        return Flexible(
                          flex: 1,
                          child: _button(
                            text: 'Dollar',
                            onPressed: (controller.valor != null)
                                ? controller.calcularDollar
                                : null,
                          ),
                        );
                      },
                    ),

                    SizedBox(
                      width: 10,
                    ),
                    // NOTE
                    Observer(
                      builder: (_) {
                        return Flexible(
                          flex: 1,
                          child: _button(
                            text: 'Real',
                            onPressed: (controller.valor != null)
                                ? controller.calculaReal
                                : null,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // NOTE resultado dos calculos
              Container(
                padding: EdgeInsets.only(top: 25),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Você tem ',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Observer(
                        builder: (_) {
                          return Text(
                            'R\$ ${controller.resultado} ${controller.getType}',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button({String text = '', Function onPressed}) => Container(
        width: double.infinity,
        child: RaisedButton(
          shape: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              color: Colors.transparent,
            ),
          ),
          onPressed: (onPressed != null)? () => onPressed() : null,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      );
}
