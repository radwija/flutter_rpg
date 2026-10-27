import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatelessWidget {
  const Create({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            StyledHeading('Welcome, new player.', textAlign: TextAlign.center),
            StyledText(
              'Create a name & slogan for your character.',
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 30),

            TextField(
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
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.chat),
                label: StyledText('Character slogan'),
              ),
              style: GoogleFonts.kanit(
                textStyle: Theme.of(context).textTheme.headlineMedium,
              ),
              cursorColor: AppColors.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
