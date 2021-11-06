import 'dart:math';

import 'package:flutter/material.dart';

class ColorRes {
  ColorRes({
    required this.name,
    required this.value,
  });

  String name;
  String value;
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String band1 = "0";
  String band2 = "0";
  String band3 = "0";
  String tolerancia = "5";
  num valorMaximo = 0.0;
  num valorMinimo = 0.0;
  num resultado = 0;
  List<ColorRes> bandas = [
    new ColorRes(name: 'Negro', value: '0'),
    new ColorRes(name: 'Marron', value: '1'),
    new ColorRes(name: 'Rojo', value: '2'),
    new ColorRes(name: 'Naranja', value: '3'),
    new ColorRes(name: 'Amarillo', value: '4'),
    new ColorRes(name: 'Verde', value: '5'),
    new ColorRes(name: 'Azul', value: '6'),
    new ColorRes(name: 'Violeta', value: '7'),
    new ColorRes(name: 'Gris', value: '8'),
    new ColorRes(name: 'Blanco', value: '9'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calcular valor de resistencias',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Calcular valor de resistencias'),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/table.jpeg'),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BuildDropDown(
                        onChanged: (String? newValue) {
                          setState(() {
                            band1 = newValue!;
                          });
                        },
                        items: this.bandas,
                        value: band1,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Text(
                          "$band1",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BuildDropDown(
                        onChanged: (String? newValue) {
                          setState(() {
                            band2 = newValue!;
                          });
                        },
                        items: this.bandas,
                        value: band2,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Text(
                          "$band2",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BuildDropDown(
                        onChanged: (String? newValue) {
                          setState(() {
                            band3 = newValue!;
                          });
                        },
                        items: this.bandas,
                        value: band3,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Text(
                          "$band3",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text("Dorado"),
                    leading: Radio(
                      value: "5",
                      groupValue: tolerancia,
                      onChanged: (value) {
                        setState(() {
                          tolerancia = value.toString();
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text("Plata"),
                    leading: Radio(
                      value: "10",
                      groupValue: tolerancia,
                      onChanged: (value) {
                        setState(() {
                          tolerancia = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      child: Text('Calcular', style: TextStyle(fontSize: 20.0)),
                      onPressed: () {
                        setState(() {
                          num numero = int.parse('$band1$band2');
                          num multiplicador = pow(10, int.parse(band3));

                          resultado = numero * multiplicador;
                          valorMaximo = resultado +
                              resultado * (double.parse(tolerancia)) / 100;
                          valorMinimo = resultado -
                              resultado * (double.parse(tolerancia)) / 100;
                          print(numero);
                          print(multiplicador);
                          print(resultado);
                        });
                      }),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Resultado ohm",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Text(
                          "$resultado",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Valor maximo  ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Text(
                          "$valorMaximo",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Valor minimo   ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Text(
                          "$valorMinimo",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class BuildDropDown extends StatelessWidget {
  final void Function(String?) onChanged;
  List<ColorRes> items;
  String value;
  BuildDropDown(
      {Key? key,
      required this.onChanged,
      required this.items,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      onChanged: onChanged,
      items: this.items.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value.value,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}
