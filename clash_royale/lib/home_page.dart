import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  Widget cardItem(String img, String nome) { // widget de card pro carrossel (cada uma das imagens com nome)
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Column(
      children: [
        GestureDetector( // ao clicar na imagem, o usuário é levado pra página de descrição
          onTap: () {
            Navigator.of(context).pushNamed('Card');
          },

          child: Image.asset(img, width: 90, height: 50,),
                
        ),
        
        SizedBox(height: 8),
        Text(nome, style: TextStyle(color: Colors.white)),
      ],
    ),
  );
  }

  Widget HomeBody() {
    return Scaffold(
      body: Center( // centralizando e definindo um tamanho pra área da tela
        child: Container(
          width: 350,
          color: const Color.fromARGB(255, 30, 38, 43),
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('Start'); // leva para a página inicial por rota nomeada
              },
              icon: Icon(Icons.arrow_back), // ícone da seta virada para a esquerda
            ),

             Text('Procure por uma carta'),

             SizedBox(height: 8,),

             TextField( // campo pra digitar
                onChanged: (text) {
                  
                },
                decoration: InputDecoration(
                  labelText: 'Digite...',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 25,),

              Text('Lançamento'),

              SizedBox(height: 10,),

              Container(
                height: 150,
                width: 300,
                alignment: Alignment(-0.35, -0.35),
                child: Image.asset('assets/img/vinhasCarta.png'), // a primeira imagem no próprio conteúdo da página
              ),

              SizedBox(height: 20,),

              Text('Mais procurados'),

              SizedBox(height: 25,),

              SingleChildScrollView( // carrossel de imagens
                scrollDirection: Axis.horizontal,
                reverse: true,
                  child: Row(
                    children: [
                      cardItem('assets/img/clashLogo.png', 'Golem'),
                      cardItem('assets/img/clashLogo.png', 'Corredor'),
                      cardItem('assets/img/clashLogo.png', 'Príncipe'),
                      cardItem('assets/img/clashLogo.png', 'Princesa'),
                      cardItem('assets/img/clashLogo.png', 'Torre'),
                      cardItem('assets/img/clashLogo.png', 'Morteiro'),
                      cardItem('assets/img/clashLogo.png', 'Barbaro'),
                    ],
                  ),
              ),

              SizedBox(height: 25,),

              SingleChildScrollView( // o segundo carrossel
                scrollDirection: Axis.horizontal,
                reverse: true,
                  child: Row(
                    children: [
                      cardItem('assets/img/clashLogo.png', 'Golem'),
                      cardItem('assets/img/clashLogo.png', 'Corredor'),
                      cardItem('assets/img/clashLogo.png', 'Príncipe'),
                      cardItem('assets/img/clashLogo.png', 'Princesa'),
                      cardItem('assets/img/clashLogo.png', 'Torre'),
                      cardItem('assets/img/clashLogo.png', 'Morteiro'),
                      cardItem('assets/img/clashLogo.png', 'Barbaro'),
                    ],
                  ),
              ),
          ],
        ),
          ),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack( // coloca um por cima do outro
        children: [

          HomeBody(), // conteúdo da página vem primeiro

          SizedBox( // a segunda imagem por cima
            child: Align(
              alignment: Alignment(0.25, -0.35),
              child: 
              Container(
                height: 155,
                width: 300,
                child: Image.asset('assets/img/vinhas.png'),
              ),
            ),
          ),

        ],
      ),
    );
  }

}