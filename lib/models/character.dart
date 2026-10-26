import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {
  Character({
    required this.id,
    required this.name,
    required this.vocation,
    required this.slogan,
  });

  final Set<Skill> skills = {};
  final String id;
  final String name;
  final Vocation vocation;
  final String slogan;
  bool _isFav = false;

  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}

List<Character> characters = [
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
