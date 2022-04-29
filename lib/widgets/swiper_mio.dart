import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperMio extends StatefulWidget {
  SwiperMio({Key key}) : super(key: key);

  @override
  State<SwiperMio> createState() => _SwiperMioState();
}

class _SwiperMioState extends State<SwiperMio> {
  List<String> listaDirecciones = ["https://cdn.pocket-lint.com/r/s/970x/assets/images/159643-tv-news-spider-man-no-way-home-image1-dryautoefj.jpg",
                                  "https://www.quever.news/u/fotografias/m/2021/5/22/f608x342-10231_39954_0.jpg",
                                  "https://cdn.pocket-lint.com/r/s/1200x/assets/images/147514-tv-news-feature-mcu-timeline-image31-vlrstw1hpb.jpg",];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250.0,
      child: Swiper(
        
        viewportFraction: 0.7,
        scale: 0.9,
        itemBuilder: (BuildContext context,int index){
          return Image.network(listaDirecciones[index],fit: BoxFit.cover,);
        },
        itemCount: listaDirecciones.length,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
      
    );
  }
}