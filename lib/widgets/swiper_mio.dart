import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class swiper_Mio extends StatelessWidget {
  const swiper_Mio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250.0,
      child: Swiper(
        
        viewportFraction: 0.7,
        scale: 0.9,
        itemBuilder: (BuildContext context,int index){
          return Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
        },
        itemCount: 5,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
      
    );
  }
}