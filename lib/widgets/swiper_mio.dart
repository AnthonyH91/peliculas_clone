import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class SwiperMio extends StatefulWidget {
  const SwiperMio({Key key}) : super(key: key);

  @override
  State<SwiperMio> createState() => _SwiperMioState();
}

class _SwiperMioState extends State<SwiperMio> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(builder: (BuildContext context, data, _) {
      return SizedBox(
          width: double.infinity,
          height: 250.0,
          child: data.allMovies.isEmpty
              ? 
                  const Center(
                      child: Image(
                    image: AssetImage('assets/Cube.gif'),
                  ))
                
              : Swiper(
                  viewportFraction: 0.5,
                  scale: 0.9,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      getImage(data.allMovies[index].image),
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: 5,
                  pagination: const SwiperPagination(),
                  control: const SwiperControl(),
                )
                )
                ;
    });
  }
}
