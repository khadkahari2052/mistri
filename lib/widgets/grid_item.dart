import 'package:flutter/material.dart';


class GridItem extends StatelessWidget {
  final IconData iconname;
  final Function onTap;
  final String title;
  const GridItem({Key? key, required this.iconname, required this.onTap, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
                  onTap: () {
                    onTap();
                  },
                  child: Container(
                    padding:EdgeInsets.all(3),
                    width: 30,
                    height:30,
                   color: Color.fromRGBO(238, 238, 238, 1), 
                   
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 70,
                        width: double.infinity,
                        child: Icon(iconname,
                        size: 40,color:Color.fromARGB(255, 43, 107, 167),),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
                        child: Text(title,style: TextStyle(),maxLines: 1,overflow: TextOverflow.clip,),
                      ),
                    ],
                   ),
                  ),
                );
              
  }
}