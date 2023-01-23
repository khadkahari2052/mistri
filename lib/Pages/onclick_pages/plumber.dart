
import 'package:buuilderapp/Pages/onclick_pages/carpenter_categories/table_chair.dart';
import 'package:flutter/material.dart';


class Plumber extends StatefulWidget {
  const Plumber({ Key? key }) : super(key: key);

  @override
  State<Plumber> createState() => _PlumberState();
}

class _PlumberState extends State<Plumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 27, 78, 119),
        title: Text("Plumber"),
      ),
      
      body:Container(
        padding:EdgeInsets.all(10),
  child: SingleChildScrollView(
    child: Column(
    
    children: <Widget>[

      InkWell(
         onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const TableChair()));
            },
        child: Card(
          child: Container(
            height: 80,
            color: Colors.white24,
            child: Row(
           children: [
            
            
            Container(
              padding: EdgeInsets.all(10),
              height: double.infinity,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/images/table.jpg",fit: BoxFit.cover,)
                )
                ),
                SizedBox(width: 10,),
                Expanded(
                 
                  child: Text("Table/Chair",style: TextStyle(fontSize: 15,fontFamily: "Poppins"),)),
            
             Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              alignment: Alignment.centerRight,
              child: Icon(Icons.arrow_forward_ios),
             )
           ],
            )
          ),
        ),
      ),
    
    
    
    
      Card(
        child: Container(
          height: 80,
          color: Colors.white24,
          child: Row(
         children: [
    
          
          Container(
            padding: EdgeInsets.all(10),
            height: double.infinity,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/furniture_repair.jpg",fit: BoxFit.cover,)
              )
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  width: 205,
                  child: Text("Furniture Repairing",style: TextStyle(fontSize: 15,fontFamily: "Poppins"),)),
              ),
    
           Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            alignment: Alignment.centerRight,
            child: Icon(Icons.arrow_forward_ios),
           )
         ],
          )
        ),
      ),
    
    
    
       Card(
        child: Container(
          height: 80,
          color: Colors.white24,
          child: Row(
         children: [
    
          
          Container(
            padding: EdgeInsets.all(10),
            height: double.infinity,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/bed.webp",fit: BoxFit.cover,)
              )
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  width: 205,
                  child: Text("Bed",style: TextStyle(fontSize: 15,fontFamily: "Poppins"),)),
              ),
    
           Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            alignment: Alignment.centerRight,
            child: Icon(Icons.arrow_forward_ios),
           )
         ],
          )
        ),
      ),
    
    
    
       Card(
        child: Container(
          height: 80,
          color: Colors.white24,
          child: Row(
         children: [
    
          
          Container(
            padding: EdgeInsets.all(10),
            height: double.infinity,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/kitchen_racks.jpg",fit: BoxFit.cover,)
              )
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  width: 205,
                  child: Text("Kitchen Racks",style: TextStyle(fontSize: 15,fontFamily: "Poppins"),)),
              ),
    
           Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            alignment: Alignment.centerRight,
            child: Icon(Icons.arrow_forward_ios),
           )
         ],
          )
        ),
      ),
    
    
       Card(
        child: Container(
          height: 80,
          color: Colors.white24,
          child: Row(
         children: [
    
          
          Container(
            padding: EdgeInsets.all(10),
            height: double.infinity,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/window.webp",fit: BoxFit.cover,)
              )
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  width: 205,
                  child: Text("Windows",style: TextStyle(fontSize: 15,fontFamily: "Poppins"),)),
              ),
    
           Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            alignment: Alignment.centerRight,
            child: Icon(Icons.arrow_forward_ios),
           )
         ],
          )
        ),
      ),
    
    
       Card(
        child: Container(
          height: 80,
          color: Colors.white24,
          child: Row(
         children: [
    
          
          Container(
            padding: EdgeInsets.all(10),
            height: double.infinity,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/door.jpg",fit: BoxFit.cover,)
              )
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  width: 205,
                  child: Text("Doors",style: TextStyle(fontSize: 15,fontFamily: "Poppins"),)),
              ),
    
           Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            alignment: Alignment.centerRight,
            child: Icon(Icons.arrow_forward_ios),
           )
         ],
          )
        ),
      ),
    
      
    ],
    ),
  ))
);
  }
}
