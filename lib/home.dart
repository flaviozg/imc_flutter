import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'calc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _varAltura = TextEditingController();
  TextEditingController _varPeso = TextEditingController();

  final _calc = Calc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('Calculo de IMC'),
          toolbarHeight: 75,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _text(),
              Divider(height: 0.1),
              _form(),
              Divider(height: 0.1),
              _result(),
            ],
          ),
        ));
  }

  Widget _text() {
    return Container(
      color: Colors.black12,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Quer descobrir seu IMC? Insira seu peso e sua altura nos campos abaixo.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
                fontSize: 18.0,
                color: Colors.black,
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _form() {
    return Container(
      color: Colors.white,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Altura (ex.: 1,70):',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                TextFormField(
                  controller: _varAltura,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Metros',
                    hasFloatingPlaceholder: false,
                  ),
                ),
                Divider(),
                Text(
                  'Peso (ex.: 69,2):',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _varPeso,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Quilos',
                    hasFloatingPlaceholder: false,
                  ),
                ),
                Divider(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VerticalDivider(),
                    RaisedButton(
                      color: Colors.blue[900],
                      textColor: Colors.white,
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 30, right: 30),
                      shape: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Text(
                        'Calcular',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        setState(() {
                          _calc.execButton(_varAltura.text, _varPeso.text);
                        });
                      },
                    ),
                    RaisedButton(
                      color: Colors.orange,
                      textColor: Colors.white,
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 30, right: 30),
                      shape: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Text(
                        'Limpar',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        setState(() {
                          _calc.clear();
                          _varAltura.text = '';
                          _varPeso.text = '';
                        });
                      },
                    ),
                    VerticalDivider(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _result() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            _calc.result,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              fontSize: 22.0,
              color: Colors.green[900],
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Image.asset(_calc.image, fit: BoxFit.fitWidth),
            ),
          ),
        ],
      ),
    );
  }
}
