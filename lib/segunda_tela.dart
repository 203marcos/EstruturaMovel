import 'package:flutter/material.dart';
import 'informativo_imagem.dart';

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
  int _selectedIndex = 0;
  int _currentArtworkIndex = 0; // Índice da obra atual

  List<String> artworks = [
    'A Criação de Adão, Michelangelo Buonarotti',
    'Mona Lisa, Leonardo da Vinci', // Adicione mais obras conforme necessário
  ];

  List<String> descriptions = [
    'A Criação de Adão é um fresco de 280cm x 570cm, pintado por Michelangelo Buonarotti por volta de 1511, que fica no teto da Capela Sistina no Vaticano. A cena representa um episódio do Livro do Gênesis no qual Deus cria o primeiro homem: Adão.',
    'Mona Lisa é uma pintura renascentista do século XVI criada por Leonardo da Vinci. Ela é considerada uma das obras mais famosas e icônicas da história da arte.'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _nextArtwork() {
    setState(() {
      _currentArtworkIndex = (_currentArtworkIndex + 1) % artworks.length;
    });
  }

  String _getImagePath(int index) {
    // Adicione lógica para obter o caminho da imagem com base no índice
    if (index == 0) {
      return 'lib/imagem_arte.png'; // Caminho da primeira imagem
    } else if (index == 1) {
      return 'lib/imagem_arte2.png'; // Caminho da segunda imagem
    }
    return ''; // Retorno padrão vazio
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NAVEGAÇÃO'),
      ),
      body: Center(
        child: _selectedIndex == 0 ? _buildHomeContent() : _buildObrasContent(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Obras',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'QR Code',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[900],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildHomeContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // Navega para outra página ao clicar
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MinhaNovaPagina()),
            );
          },
          child: Image.asset(
            'lib/unifor_ima.png', // Substitua pelo caminho real da sua imagem
            width: 250,
            height: 150,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Implemente a navegação para a segunda tela aqui
          },
          child: Image.asset(
            'lib/unifor_ima.png', // Substitua pelo caminho real da sua imagem
            width: 250,
            height: 150,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Implemente a navegação para a terceira tela aqui
          },
          child: Image.asset(
            'lib/unifor_ima.png', // Substitua pelo caminho real da sua imagem
            width: 250,
            height: 150,
          ),
        ),
      ],
    );
  }

  Widget _buildObrasContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          artworks[_currentArtworkIndex],
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            // Implemente a navegação para a tela de obras aqui
          },
          child: Image.asset(
            _getImagePath(
                _currentArtworkIndex), // Obtém o caminho da imagem da obra atual
            width: 250, // Aumentando o tamanho da imagem
            height: 150,
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                descriptions[_currentArtworkIndex],
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.volume_up,
              size: 50,
            ),
            SizedBox(width: 10),
            Text(
              'Áudio Descrição',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: _nextArtwork,
          child: Text('Próxima Obra'),
        ),
      ],
    );
  }
}
