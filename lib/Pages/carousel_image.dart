import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatefulWidget {
  const CarouselImage({ Key? key }) : super(key: key);

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
late PageController _pageController;
  List<String>imgList=[
     
     ("assets/images/10.webp"),
     ("assets/images/9.jpg"),
     ("assets/images/6.webp"),
     ("assets/images/8.jpg"),
     ("assets/images/12.jpg"),
     
    ];

 

  @override
  Widget build(BuildContext context) {
     return ClipRRect(
      borderRadius: BorderRadius.circular(20),
       child: Container(
        
        height:130,
        width: double.infinity,
       child:CarouselSlider.builder(
                  itemCount: imgList.length,
                  itemBuilder: (context, index, realIndex) {
                    print(index);
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      
                      child: Image.asset(imgList[index],fit: BoxFit.cover,),
                    );
                  },
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                )),
     );
  }
}