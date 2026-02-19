import 'package:flutter/widgets.dart';

class CharacterModel {
  int id;
  String name;
  String status;
  String species;
  String type;
  String geneder;
  String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.geneder,
    required this.image,
  });
  factory CharacterModel.fromJson(Map<String, dynamic>json){
    return CharacterModel(
    id: json['id'], 
    name: json['name'], 
    status: json['status'], 
    species: json['species'], 
    type: json['type'], 
    geneder: json['gender'], 
    image: json['image'],
    );
  }
}
