import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_formulario/main.dart';

class FormAzucar extends StatefulWidget {
  const FormAzucar({super.key});

  @override
  State<FormAzucar> createState() => _AzucarState();
}

class _AzucarState extends State<FormAzucar> {
  final azucar = TextEditingController();

  String nivelAzucar = '';
  String resultado = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            drawer: const Navigation(),
            appBar: AppBar(
              title: const Text("Azucar"),
              backgroundColor: Colors.blue.shade700,
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Image.asset("images/R.png", width: 170, height: 170),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      enableInteractiveSelection: false,
                      textCapitalization: TextCapitalization.characters,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        labelText: "Azucar: mg/dl",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      controller: azucar,
                    )),
                Container(
                    margin: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          if (azucar.text != "") {
                            nivelAzucar = azucar.text;
                            resultado = calcular(nivelAzucar);
                            showCupertinoDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: const Text(
                                  "Resultado",
                                  style: TextStyle(fontSize: 22),
                                ),
                                content: Text(resultado,
                                    style: const TextStyle(fontSize: 16)),
                                actions: [
                                  CupertinoDialogAction(
                                    child: const Text("OK"),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: const Text(
                                  "Advertencia",
                                  style: TextStyle(fontSize: 22),
                                ),
                                content: const Text(
                                    "Favor de llenar los campos y no exija como si enseñara",
                                    style: TextStyle(fontSize: 16)),
                                actions: [
                                  CupertinoDialogAction(
                                    child: const Text("OK"),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text("Resultado"))),
              ],
            ))));
  }
}

String calcular(nivelAzucar) {
  String texto = "";
  int nivel = int.parse(nivelAzucar);
  if (nivel <= 140) {
    texto = "Nivel de azucar Normal";
  }
  if (nivel > 140 && nivel <= 199) {
    texto = "Tienes Prediabetes";
  }
  if (nivel > 199) {
    texto = "Tienes Diabetes";
  }
  return texto;
}

Widget createDialog(BuildContext context) => CupertinoAlertDialog(
      title: const Text(
        "Resultado",
        style: TextStyle(fontSize: 22),
      ),
      content: const Text(
        "Holaaaaaa",
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        CupertinoDialogAction(
          child: const Text("OK"),
          onPressed: () {},
        ),
      ],
    );
