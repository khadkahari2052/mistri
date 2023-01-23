import 'dart:ui';


import 'package:buuilderapp/Pages/LoginPage/login_page.dart';

import 'package:buuilderapp/Pages/bottom_navigation.dart';
import 'package:buuilderapp/Pages/carousel_image.dart';
import 'package:buuilderapp/Pages/drawer.dart';
import 'package:buuilderapp/Pages/onclick_pages/carpenter.dart';
import 'package:buuilderapp/Pages/onclick_pages/electrician.dart';
import 'package:buuilderapp/Pages/onclick_pages/it_solution.dart';
import 'package:buuilderapp/Pages/onclick_pages/painter.dart';
import 'package:buuilderapp/Pages/onclick_pages/plumber.dart';
import 'package:buuilderapp/Pages/onclick_pages/repair.dart';
import 'package:buuilderapp/custom_icon.dart';
import 'package:buuilderapp/widgets/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> gridData=[
    {"title":"Plumber", "icondata":MyFlutterApp.tap_ate3018t6hns},
    {"title":"Painter", "icondata":MyFlutterApp.painter_h5t7do9mj0zg},
    {"title":"Electrician", "icondata":MyFlutterApp.electrician_u1nm1im4g99j},
    {"title":"Repair", "icondata":MyFlutterApp.settings_p9d66eozgb85},
    {"title":"ITServices", "icondata":MyFlutterApp.online_services_jeexdh41a2r4},
    {"title":"Carpenter", "icondata":MyFlutterApp.carpenter_ial5q6o1hk6m},
    {"title":"Plumber", "icondata":MyFlutterApp.tap_ate3018t6hns},
    {"title":"Painter", "icondata":MyFlutterApp.painter_h5t7do9mj0zg},
    {"title":"Electrician", "icondata":MyFlutterApp.electrician_u1nm1im4g99j},
    {"title":"Repair", "icondata":MyFlutterApp.settings_p9d66eozgb85},
    {"title":"ITServices", "icondata":MyFlutterApp.online_services_jeexdh41a2r4},
    {"title":"Carpenter", "icondata":MyFlutterApp.carpenter_ial5q6o1hk6m},
    {"title":"Plumber", "icondata":MyFlutterApp.tap_ate3018t6hns},
    {"title":"Painter", "icondata":MyFlutterApp.painter_h5t7do9mj0zg},
    {"title":"Electrician", "icondata":MyFlutterApp.electrician_u1nm1im4g99j},
    {"title":"Repair", "icondata":MyFlutterApp.settings_p9d66eozgb85},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

 //drawer
    drawer: DrawerPage(),

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 78, 119),
        centerTitle: true,
        title: Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[ 
          Text("Mis",style: TextStyle(fontFamily: "Bungee"),),
         
          Text("-",style: TextStyle(fontFamily: "Bungee",color: Colors.yellow),),
          
          Text("Tri",style: TextStyle(color: Colors.grey[200],fontFamily: "Bungee"))
          ]),
          actions:[
            IconButton(onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()
            )
            );},
             icon: Icon(Icons.person)
             )


          ]
      ),


      body:Container(
        padding:EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextFormField(
              style: TextStyle(
                fontSize: 15.sp
              ),
              decoration:InputDecoration(
                
                hintText:"Search",
                labelText: "Search Services",
                suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              )
            ),
      SizedBox(height:10.h),
        // Container(
        //   child:ClipRRect(
        //     borderRadius:BorderRadius.circular(20),
        //     child: Image.asset("assets/images/1.jpg",fit:BoxFit.cover,)),
        //   height: 130,
        //   width:double.infinity
        // ),
        CarouselImage(),
      
      
      SizedBox(height: 10.h,),
      
      Divider(thickness: 1,
      indent: 130,
      endIndent:130,
      color:Colors.black45
      ),
      
      SizedBox(height:10.h),
      
       ClipRRect(
        borderRadius:BorderRadius.circular(10),
         child: Container(
          decoration: BoxDecoration(
          
          color: Colors.grey[200],
          // border: Border.all(color: Color.fromARGB(255, 27, 78, 119),)  //can be remove part
          ),
          
          
         child: GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children:List.generate(gridData.length, (index) {
            return  
            
            GridItem(iconname:gridData[index]["icondata"] , onTap: (){
              if(index==0){
                //naviagagte to carpenter page
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Plumber()));
              }
              if(index ==1){
                //navigate to paienrter page
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const Painter()));
              }
              if(index ==2){
                // navigage to electriican page.
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const Electrician()));
              }
               if(index ==3){
                // navigage to electriican page.
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const Repair()));
              }
               if(index ==4){
                // navigage to electriican page.
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const ITSolution()));
              }
               if(index ==5){
                // navigage to electriican page.
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const Carpenter()));
              }
            }, title:gridData[index]["title"],);
          }),
         
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: 2/2.5,
            ),
            ),
             
            
         ),
       ),
       
      //  Container(
      //   color: Colors.red,
      //   height:100,
      //  ),
      
          ],
        ),
      
        
      ),
      //bottomNavigationBar:BottomNavigation()
    );
  }
}