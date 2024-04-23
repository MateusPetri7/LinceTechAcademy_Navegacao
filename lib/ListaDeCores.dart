import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class InformacoesCores {
  const InformacoesCores(this.cor, this.nomeCor);

  final Color cor;
  final String nomeCor;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Cores(),
        '/cor': (context) {
          return TelaCorSelecionada(
              ModalRoute.of(context)!.settings.arguments as Color);
        },
      },
    );
  }
}

class Cores extends StatelessWidget {
  const Cores({Key? key}) : super(key: key);

  final cores = const [
    InformacoesCores(Colors.green, "Verde"),
    InformacoesCores(Colors.red, "Vermelho"),
    InformacoesCores(Colors.cyan, "Ciano"),
    InformacoesCores(Colors.white, "Branco"),
    InformacoesCores(Colors.blue, "Azul"),
    InformacoesCores(Colors.pink, "Rosa"),
    InformacoesCores(Colors.yellow, "Amarelo"),
    InformacoesCores(Colors.orange, "Laranja"),
    InformacoesCores(Colors.purple, "Roxo"),
    InformacoesCores(Colors.deepOrange, "Laranja Profundo")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Selecione uma cor'),
        ),
      ),
      body: ListView.builder(
        itemCount: cores.length,
        itemBuilder: (context, index) {
          final item = cores[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/cor', arguments: item.cor);
            },
            child: Container(
              color: item.cor,
              height: 40,
              child: Center(
                child: Text(item.nomeCor),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TelaCorSelecionada extends StatelessWidget {
  final Color color;

  const TelaCorSelecionada(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cor selecionada"),
      ),
      body: Container(
        color: color,
      ),
    );
  }
}
