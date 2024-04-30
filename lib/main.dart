import 'package:flutter/material.dart';
import 'package:estudocaso/segunda_tela.dart'; // Importe a segunda tela aqui
import 'package:estudocaso/tela_cadastro.dart'; // Importe a tela de cadastro aqui

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeiraAplicacao(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor:
              Colors.black, // Definindo a cor do texto selecionado como preto
        ),
      ),
    );
  }
}

class PrimeiraAplicacao extends StatefulWidget {
  @override
  PrimeiraAplicacaoState createState() {
    return PrimeiraAplicacaoState();
  }
}

class PrimeiraAplicacaoState extends State<PrimeiraAplicacao> {
  late String user;
  late String password;

  void login() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  void cadastrar() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TelaCadastro()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.blue, title: Text('Página Inicial')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/uniforsimb.jpg', // substitua pelo caminho da sua imagem
                width: 200, // ajuste conforme necessário
                height: 200, // ajuste conforme necessário
              ),
              SizedBox(
                height: 20, // Espaço entre a imagem e o formulário de login
              ),
              TextField(
                onChanged: (text) {
                  user = text;
                },
                decoration: InputDecoration(labelText: 'Usuário'),
              ),
              TextField(
                onChanged: (text) {
                  password = text;
                },
                obscureText: true,
                decoration: InputDecoration(labelText: 'Senha'),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: login,
                      child: Text('Login'),
                    ),
                    ElevatedButton(
                      onPressed: cadastrar,
                      child: Text('Cadastrar'),
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
}
