import 'package:flutter/material.dart';

class RowMio extends StatelessWidget {
  RowMio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 2.0,
        runSpacing: 2.0,
        children: [
          ActionChip(
            onPressed: () {},
            label: const Text('DRAMA'),
          ),
          ActionChip(
            onPressed: () {},
            label: const Text('COMEDIA'),
          ),
          ActionChip(
            onPressed: () {},
            label: const Text('CIENCIA FICCION'),
          ),
          ActionChip(
            onPressed: () {},
            label: const Text('AVENTURA'),
          ),
          ActionChip(
            onPressed: () {},
            label: const Text('ROMANCE'),
          ),
          ActionChip(
            onPressed: () {},
            label: const Text('POLICIALES'),
          ),
          ActionChip(
            onPressed: () {},
            label: const Text('INFANTILES'),
          ),
        ],
      ),
    );
  }
}
