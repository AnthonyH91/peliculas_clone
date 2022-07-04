import 'package:flutter/material.dart';

class ChipGenero extends StatelessWidget {
  final String nameGenre;
  final String id;

  const ChipGenero({Key? key, 
    required this.nameGenre,
    required this.id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(nameGenre),
      //avatar: Image.asset('assets/cubofoto.jpg'),
      onPressed: () {},
    );
  }
}
