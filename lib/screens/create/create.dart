import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/screens/home.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const StyledHeading('Missing Character Name'),
            content: const StyledText(
              'Every good RPG character needs a great name...',
            ),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: StyledHeading('Close'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );

      return;
    }

    if (_sloganController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const StyledHeading('Missing Slogan'),
            content: const StyledText('Remember to add a catchy slogan...'),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: StyledHeading('Close'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );

      return;
    }

    characters.add(
      Character(
        id: uuid.v4(),
        name: _nameController.text,
        vocation: selectedVocation,
        slogan: _sloganController.text,
      ),
    );

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              StyledHeading(
                'Welcome, new player.',
                textAlign: TextAlign.center,
              ),
              StyledText(
                'Create a name & slogan for your character.',
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30),

              TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Character name'),
                ),
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                ),
                cursorColor: AppColors.textColor,
              ),
              SizedBox(height: 10),
              TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: _sloganController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Character slogan'),
                ),
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                ),
                cursorColor: AppColors.textColor,
              ),
              SizedBox(height: 30),

              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              StyledHeading('Choose a Vocation.', textAlign: TextAlign.center),
              StyledText(
                'This determines your available skills.',
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30),

              VocationCard(
                vocation: Vocation.junkie,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.junkie,
              ),
              VocationCard(
                vocation: Vocation.ninja,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.ninja,
              ),
              VocationCard(
                vocation: Vocation.raider,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.raider,
              ),
              VocationCard(
                vocation: Vocation.wizard,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.wizard,
              ),

              SizedBox(height: 30),

              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: StyledHeading('Create Character'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
