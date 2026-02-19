import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/core/models/character_model.dart';
import 'package:rick_and_morty/core/presentation/widgets/card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}
 
class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  String url = "https://rickandmortyapi.com/api/character";
  Future<List<CharacterModel>> fetchCharactertModel() async {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200){
          print('Заебись все работает дата пришла');
          Map<String, dynamic> jsonData = json.decode(response.body);
          List results = jsonData['results'];
          List<CharacterModel> characters = results.map((json){
            return CharacterModel.fromJson(json);
          }).toList();
          return characters;
        }
        else{
          print('все пизда не работает ошибка: ${response.statusCode}');
          return [];
        }}
        

  final List<CharacterModel> items = [];

@override
void initState() {
  super.initState();
  fetchCharactertModel().then((loadedItems) {
    setState(() {
      items.addAll(loadedItems);  
      isLoading = false;
    });
    });
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child:  isLoading 
        ? CircularProgressIndicator()
        :ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 10),
          padding: EdgeInsets.all(20),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return CardWidget(
              item: items[index],
              onPressed: () {},
            );
          },
        ),
      ),
    );
  }
}