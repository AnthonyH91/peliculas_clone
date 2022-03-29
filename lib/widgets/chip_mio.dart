import 'package:flutter/material.dart';

class Chip_Mio extends StatelessWidget {
  Chip_Mio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: () {
        
      },
      avatar: const Icon(
        Icons.play_circle,
        color: Colors.deepPurple,
      ),
      label: const Text('Genero'),
    );
  }
}