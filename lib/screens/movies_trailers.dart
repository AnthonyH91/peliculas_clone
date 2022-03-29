import 'package:flutter/material.dart';

class Movies_Trailers extends StatelessWidget {
  const Movies_Trailers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TRAILERS'),
        backgroundColor: Colors.redAccent,
        actions: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
                          PopupMenuButton(itemBuilder: (context) {
                            return[const PopupMenuItem(child: Text('Ayuda')),
                                  const PopupMenuItem(child: Text('Recomendar APP'))];
                          },)
                          ],
      ),
      body: Container(),
    );
  }
}