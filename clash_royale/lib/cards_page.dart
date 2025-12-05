import 'dart:convert';

import 'package:clash_royale/cards.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CardsPage extends StatefulWidget {
  final int id;

  const CardsPage({super.key, required this.id});

  @override
  State<StatefulWidget> createState() {
    return CardsPageState();
  }
}

class CardsPageState extends State<CardsPage> {
  List<Cards> list = List.empty();
  Cards card = Cards();

  void getCardsbyId() async {
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
      list = (data["items"] as List)
          .map((item) => Cards.fromJson(item))
          .toList();
    }
    Cards? idCard = list.firstWhere(
      (c) => c.id == widget.id,
      orElse: () => Cards(),
    );
    setState(() {
      card = idCard;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCardsbyId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // centralizando e definindo um tamanho pra área da tela
        child: Container(
          width: 350,
          height: double.infinity,
          color: const Color.fromARGB(255, 30, 38, 43),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          'Home',
                        ); // leva para a página inicial por rota nomeada
                      },
                      icon: Icon(
                        Icons.arrow_back,
                      ), // ícone da seta virada para a esquerda
                    ),

                    Title(
                      color: Colors.yellow,
                      child: Text(
                        'Descrição da carta',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // aqui estão as informações sobre a carta
                Text('Nome: ${card.name}'),
                Text('Raridade: ${card.rarity}'),
                Text('Custo de elixir: ${card.elixirCost}'),
                Text('Nível máximo: ${card.maxLevel}'),
                Text('Nível máximo de evolução: ${card.maxEvolutionLevel}'),

                SizedBox(height: 20),

                // as imagens da carta normal e de sua versão evoluida, as quais são puxadas da API
                Text('Ícone da carta:', style: TextStyle(fontSize: 20)),

                Center(
                  child: Container(
                    height: 175,
                    width: 250,
                    child: Image.network(
                      "https://corsproxy.io/?${card.iconUrls?.medium ?? ""}",
                    ), // imagem da carta
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  'Ícone da carta evoluída:',
                  style: TextStyle(fontSize: 20),
                ),

                Center(
                  child: Container(
                    height: 175,
                    width: 250,
                    child: Image.network(
                      "https://corsproxy.io/?${card.iconUrls?.evolutionMedium ?? card.iconUrls?.medium ??""}",
                    ), // imagem da carta
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
