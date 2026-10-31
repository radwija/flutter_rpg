import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [
    Character(
      id: '1',
      name: 'Zilong',
      vocation: Vocation.junkie,
      slogan: 'The dragon warior is back!',
    ),
    Character(
      id: '2',
      name: 'Hayabusa',
      vocation: Vocation.ninja,
      slogan: 'Lemme get the way to my master.',
    ),
    Character(
      id: '3',
      name: 'Alpha',
      vocation: Vocation.raider,
      slogan: 'Alpha is online.',
    ),
    Character(
      id: '4',
      name: 'Cyclops',
      vocation: Vocation.wizard,
      slogan: 'You have a good taste.',
    ),
  ];

  get characters => _characters;
  void addCharacter(Character character) {
    _characters.add(character);
    notifyListeners();
  }
}
