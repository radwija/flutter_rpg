import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodyMedium);
  }
}

class StyledHeading extends StatelessWidget {
  const StyledHeading({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headlineMedium);
  }
}

class StyledTitle extends StatelessWidget {
  const StyledTitle({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleMedium);
  }
}
