import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_formulario/main.dart';

class FormPresion extends StatefulWidget {
  const FormPresion({super.key});

  @override
  State<FormPresion> createState() => _PresionState();
}

class _PresionState extends State<FormPresion> {
  final sistolico = TextEditingController();
  final diastolico = TextEditingController();

  String nivelSistolico = '';
  String nivelDiastolico = '';
  String resultado = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            drawer: const Navigation(),
            appBar: AppBar(
              title: const Text("Presión"),
              backgroundColor: Colors.blue.shade700,
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                const SizedBox(
                  height: 100,
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
                        labelText: "Sistólico:",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      controller: sistolico,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      enableInteractiveSelection: false,
                      textCapitalization: TextCapitalization.characters,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        labelText: "Diastólico:",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      controller: diastolico,
                    )),
                Container(
                    margin: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          if (sistolico.text != "" && diastolico.text != "") {
                            nivelSistolico = sistolico.text;
                            nivelDiastolico = diastolico.text;
                            resultado =
                                calcular(nivelSistolico, nivelDiastolico);
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

String calcular(data1, data2) {
  String texto = "";
  int n1 = int.parse(data1);
  int n2 = int.parse(data2);
  if (n1 <= 120 && n1 > 90) {
    if (n2 <= 80) {
      texto = "Tu nivel de Presión es Normal";
    }
    if (n2 > 80) {
      texto = "Presion Arterial Alta (Hipertensión)";
    }
  }
  if (n1 > 120) {
    texto = "Presion Arterial Alta (Hipertensión)";
  }
  if (n1 < 90) {
    texto = "Presion Arterial Baja (Hipotensión)";
  }
  return texto;
}
