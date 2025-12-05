import 'dart:convert';

import 'package:clash_royale/cards.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Cards> cards = List.empty();

  @override
  void initState() {
    super.initState();
    getCards();
  }

  void getCards() async {
    final url = Uri.parse("https://proxy.royaleapi.dev/v1/cards");

    final response = await http.get(
      url,
      headers: {
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImQwY2I5OWRlLWQ5ZmItNDBjOS05M2M3LWJjNjc2YTY4YjAyMSIsImlhdCI6MTc2NDg4MDgwMiwic3ViIjoiZGV2ZWxvcGVyLzBmMTdmNGM0LTZlZGQtZDk5ZS03MzBjLTYzYTZkODNjZjQxMCIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyI0NS43OS4yMTguNzkiLCIxODYuMjYuNjkuODgiXSwidHlwZSI6ImNsaWVudCJ9XX0.JaXkkEMW2xFUIYHbwMIDIBW_UOcZoTRIwOf8bto6TapIDeTfvic4EIMruo0kvWSAJq7lKFHMA2DJXorxatypIQ",
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        cards = (data["items"] as List)
            .map((item) => Cards.fromJson(item))
            .toList();
      });
    }
  }

  Widget cardItem(String img, String nome, int id) {
    // widget de card pro carrossel (cada uma das imagens com nome)
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          GestureDetector(
            // ao clicar na imagem, o usuário é levado pra página de descrição
            onTap: () {
              Navigator.of(context).pushNamed('Card', arguments: id);
            },

            child: Image.network(img, width: 90, height: 100, fit: BoxFit.fill),
          ),

          SizedBox(height: 8),
          Text(nome, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget homeBody() {
    return Scaffold(
      body: Center(
        // centralizando e definindo um tamanho pra área da tela
        child: Container(
          width: 400,
          color: const Color.fromARGB(255, 30, 38, 43),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      'Start',
                    ); // leva para a página inicial por rota nomeada
                  },
                  icon: Icon(
                    Icons.arrow_back,
                  ), // ícone da seta virada para a esquerda
                ),

                Text('Procure por uma carta'),

                SizedBox(height: 8),

                TextField(
                  // campo pra digitar
                  onChanged: (text) {},
                  decoration: InputDecoration(
                    labelText: 'Digite...',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 25),

                Text('Lançamento'),

                SizedBox(height: 10),

                Container(
                  height: 150,
                  width: 300,
                  alignment: Alignment(-0.35, -0.35),
                  child: Image.asset(
                    'assets/img/vinhasCarta.png',
                  ), // a primeira imagem no próprio conteúdo da página
                ),

                SizedBox(height: 100),

                Text('Mais procurados'),

                // SizedBox(height: 25),
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    // carrossel de imagens
                    itemCount: rarity(["legendary", "champion"]).length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final cards = rarity(["legendary", "champion"]);
                      return cardItem(
                        "https://corsproxy.io/?${cards[index].iconUrls?.medium}",
                        "${cards[index].name}",
                        cards[index].id ?? 0,
                      );
                    },
                  ),
                ),

                SizedBox(height: 25),
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    // carrossel de imagens
                    itemCount: rarity(["common", "rare", "epic"]).length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                        final cards = rarity(["common", "rare", "epic"]);
                        return cardItem(
                          "https://corsproxy.io/?${cards[index].iconUrls?.medium}",
                          "${cards[index].name}",
                          cards[index].id ?? 0,
                        );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // coloca um por cima do outro
        children: [
          homeBody(), // conteúdo da página vem primeiro

          SizedBox(
            // a segunda imagem por cima
            child: Align(
              alignment: Alignment(0.25, -0.35),
              child: SizedBox(
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

  List<Cards> rarity(List<String> list) {
    return cards.where((c) => list.contains(c.rarity)).toList();
  }
}
