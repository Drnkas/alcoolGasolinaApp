// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){

    double precoAlcool = double.tryParse( _controllerAlcool.text.replaceAll(",", ".")) ?? 0.0;
    double precoGasolina = double.tryParse( _controllerGasolina.text.replaceAll(",", ".")) ?? 0.0;

      print("Alcool: " + precoAlcool.toString());
      print("Gasolina: " + precoGasolina.toString());

    if ( precoAlcool == 0.0 || precoGasolina == 0.0 ) {
      setState(() {
        _textoResultado = "Número inválido, digite um número maior que 0";
      });
    } else {

      if( (precoAlcool / precoGasolina) >= 0.7 ) {
        setState(() {
          _textoResultado = "O ideal é abastecer com gasolina";
        });
      } else{
        setState(() {
          _textoResultado = "O ideal é abastecer com gasolina";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logoApp.jpeg"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Descubra a melhor opção de abastecimento para seu carro:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Álcool, ex: 1.59"
                ),
                style: TextStyle(
                    fontSize: 20
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 1.59"
                ),
                style: TextStyle(
                    fontSize: 20
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: Text("Calcular"),
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

