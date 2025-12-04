import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return InitialPageState();
  }
}

class InitialPageState extends State<InitialPage>{

  Widget initialBody(){ // conteúdo da página
    return Center( // centralizando e definindo um tamanho para a área da tela
      child: Container(
      width: 350,
      height: double.infinity,
      child: Column(
        children: [

          SizedBox(height: 150,),

          Container(
            height: 250,
            width: 325,
            child: Image.asset('assets/img/clashLogo.png'), // logo do clash royale
          ),

          SizedBox(height: 30),
          
          Title(color: Colors.yellow, child: Text('Royal Wiki', style: TextStyle(fontSize: 30),)),

          SizedBox(height: 15,),

          Text('Veja todas as cartas de CLASH ROYALE!'),

          SizedBox(height: 30,),

          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
            onPressed: () {
                Navigator.of(context).pushNamed('Home'); // botão levando pra tela home por rota nomeada
            },
            child: Text('Entre Agora', style: TextStyle(fontSize: 20),)
          )
          ),
        ],    
      )
      ),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( //posiciona um em cima do outro
        children: [
            Center(
              child: Container(
              color: const Color.fromARGB(255, 30, 38, 43), // Fundo azul por baixo
              height: double.infinity,
              width: 350,
            ),
            ),

            Container( // alinha a imagem dos personagens de fundo, no centro e um pouco abaixo do topo
            child: Align(
                alignment: Alignment(0, -0.6),
            child: 
            SizedBox(
              width: 350,
              child: Image.asset('assets/img/clashFundo.jpeg'),
            ),            
            ),
            ),
            
            initialBody() // conteúdo da página, aparece por cima de tudo
        ],
      )
    );
  }
}