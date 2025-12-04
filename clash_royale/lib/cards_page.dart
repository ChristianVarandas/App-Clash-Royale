import 'package:flutter/material.dart';

class CardsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return CardsPageState();
  }

}

class CardsPageState extends State<CardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // centralizando e definindo um tamanho pra área da tela
        child: Container(
          width: 350,
          height: double.infinity,
          color: const Color.fromARGB(255, 30, 38, 43),
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 8),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('Home'); // leva para a página inicial por rota nomeada
                  },
                    icon: Icon(Icons.arrow_back), // ícone da seta virada para a esquerda
                  ),

                  Title(color: Colors.yellow, child: Text('Descrição da carta', style: TextStyle(fontSize: 25),))
  
                ],
              ),

              SizedBox(height: 10,),
              
              // aqui estão as informações sobre a carta

              Text('Nome:'),
              Text('Raridade:'),
              Text('Custo de elixir:'),
              Text('Nível máximo:'),
              Text('Nível máximo de evolução:'),

              SizedBox(height: 20,),

              // as imagens da carta normal e de sua versão evoluida, as quais são puxadas da API

              Text('Ícone da carta:', style: TextStyle(fontSize: 20),),

              Center(
                child: 
                Container(
                  height: 175,
                  width: 250,
                  child: Image.asset('assets/img/vinhasCarta.png'), // imagem da carta
                ),
              ),

              SizedBox(height: 20,),

              Text('Ícone da carta evoluída:', style: TextStyle(fontSize: 20),),

              Center(
                child: 
                Container(
                  height: 175,
                  width: 250,
                  child: Image.asset('assets/img/vinhasCarta.png'), // imagem da carta
                ),
              ),

            ],
          ),
          
          )
          
        ),
      ),
    );
  }

}