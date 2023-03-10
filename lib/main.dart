import 'package:flutter/material.dart';
import 'package:flutter_formulario/widgets/formulario_azucar.dart';
import 'package:flutter_formulario/widgets/formulario_presion.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Bienvenido"),
              backgroundColor: Colors.blue.shade700,
            ),
            drawer: const Navigation(),
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
                  child: const Text(
                    "Hola, Bienvenido a la Aplicación por favor selecciona la opción de tu agrado en el Menu.",
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ))));
  }
}

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        buildHeader(context),
        buildMenuItems(context),
      ],
    )));
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text("Inicio"),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) {
                return const MyApp();
              },
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.favorite_border_sharp),
          title: const Text("Presión"),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const FormPresion();
              },
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.workspaces_outline),
          title: const Text("Azúcar"),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const FormAzucar();
              },
            ));
          },
        ),
      ],
    );
  }
}
