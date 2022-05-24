import 'package:flutter/material.dart';

class ChipGenero extends StatelessWidget {
  final String nameGenre;
  final String id;

  ChipGenero({
    @required this.nameGenre,
    @required this.id,
  });
  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text('$nameGenre,$id'),
      avatar: Image.asset('assets/cubofoto.jpg'),
      onPressed: () {},
    );
  }
}
