import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MinhaNovaPagina()),
            );
          },
          child: Text(
            'Clique aqui para ir para a nova página',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class MinhaNovaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Nova Página'),
      ),
      body: Center(
        child: SingleChildScrollView(
          // Torna a página rolável
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Exposição de Arte: UNIFOR Plástica',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.asset(
                'lib/unifor_ima.png', // Substitua pelo caminho real da sua imagem
                width: 250,
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'Descrição do Local: Centro de artes UNIFOR',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                'Horário de Funcionamento: 10h às 18h',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                'Duração da Exposição: 20 de agosto - 30 de outubro',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
