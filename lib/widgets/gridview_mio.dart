import 'package:flutter/material.dart';

class GridViewMio extends StatelessWidget {
  const GridViewMio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 18,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              height: 50,
              width: 50,
              color: Color.fromARGB(255, 69, 83, 73),
            ),
          ),
        );
      },
    );
  }
}
