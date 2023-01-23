import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({ Key? key }) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return 

//drawer
    Drawer(
  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the drawer if there isn't enough vertical
  // space to fit everything.
  child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      Container(margin:EdgeInsets.all(3),
        child: const DrawerHeader(
                decoration: BoxDecoration(
                  
                  
                  color:Color.fromARGB(255, 27, 78, 119),
                ), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Color.fromARGB(255, 27, 78, 119)),
                  accountName: Text(
                    "MisTri",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("mistri@gmail.com"),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        "A",
                        style: TextStyle(fontSize: 30.0, color: Color.fromARGB(255, 27, 78, 119)),
                      ), //Text
                    ),
                  ),
                   //circleAvatar
                ), //UserAccountDrawerHeader
              ),
      ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              // margin: EdgeInsets.only(left:18),
              child: Text("Categories",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 27, 78, 119)),)), 
              
              SizedBox(height: 10,),
              
        Card(
          color: Color.fromARGB(255, 27, 78, 119),
          // elevation: 40,
          // shadowColor: Colors.blue,
          child: Container(
            
            
            child:Column(
              children: [
                 ListTile(
                leading: const Icon(Icons.person,color: Colors.white,),
                title: const Text('Profile ',style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              Divider(
                thickness:2,
                color: Colors.white
                ,),
              ListTile(
                leading: const Icon(Icons.language,color: Colors.white,),
                title: const Text('Language ',style: TextStyle(color: Colors.white)
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              
             
               Divider(
                thickness:2,
                color: Colors.white
                ,),
              ListTile(
                leading: const Icon(Icons.contact_phone,color: Colors.white,),
                title: const Text('Contact ',style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
               Divider(
                thickness:2,
                color: Colors.white
                ,),
              ListTile(
                leading: const Icon(Icons.info,color: Colors.white,),
                title: const Text('About Us ',style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
               Divider(
                thickness:2,
                color: Colors.white
                ,),
              ListTile(
                leading: const Icon(Icons.login,color: Colors.white,),
                title: const Text('Login',style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
               Divider(
                thickness:2,
                color: Colors.white
                ,),


                
        
             
             
              ],),
        
          ),
        ),


        SizedBox(height: 10,),
Container(
              alignment: Alignment.center,
              // margin: EdgeInsets.only(left:18),
              child: Text("Useful Links",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 27, 78, 119)),)), 
              

              SizedBox(height: 10,),

        Card(
          color: Color.fromARGB(255, 27, 78, 119),
          // elevation: 40,
          // shadowColor: Colors.green,
          child: Container(
            
            
            child:Column(
              children: [
                 ListTile(
                leading: const Icon(Icons.web_asset_outlined,color: Colors.white,),
                title: const Text('Website ',style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              Divider(
                thickness:2,
                color: Colors.white
                ,),
              ListTile(
                leading: const Icon(Icons.youtube_searched_for,color: Colors.white,),
                title: const Text('Youtube ',style: TextStyle(color: Colors.white)
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              
             
               Divider(
                thickness:2,
                color: Colors.white
                ,),
              ListTile(
                leading: const Icon(Icons.facebook,color: Colors.white,),
                title: const Text('Facebook ',style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              
              

                
        
             
             
              ],),
        
          ),
        ),

       
             
    ],
  ),


  
);

    
  }
}