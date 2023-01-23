import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TableChair extends StatefulWidget {
  const TableChair({ Key? key }) : super(key: key);

  @override
  State<TableChair> createState() => _TableChairState();
}

class _TableChairState extends State<TableChair> {
  final number='+9779849562425';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Table/Chair"),
        backgroundColor: Color.fromARGB(255, 27, 78, 119),
      ),

      body:  Card(
          color: Colors.white54,
          // elevation: 40,
          // shadowColor: Colors.blue,
          child: Container(
            
            
            child:Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    
                    height: 180,
                   child:
                   Column(
                    children: [

                   
                   Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Table And Chair Repairing",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                   SizedBox(height: 10,),
                   
                   Container(
                    alignment: Alignment.centerLeft,
                    child: Text("We repair tables and chairs",style: TextStyle(color: Colors.black,),)),
SizedBox(height:30,),


                   Container(
                     child: OutlinedButton(onPressed: ()async{
                    launch('tel://$number');
                     }, 
                     child: Text("DIRECT CALL"),
                     
                     ),
                   ),

                   OutlinedButton(onPressed: (){}, child: Text("REQUEST APPOINTMENT"),
                   
                   ),
                   ],
                   )),
                ),


              Divider(
                thickness:2,
                color: Colors.white
                ,),


                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    
                    height: 180,
                   child:
                   Column(
                    children: [

                   
                   Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Making Table And Chair ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                   SizedBox(height: 10,),
                   
                   Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Taking Orders For New Tables And Chair",style: TextStyle(color: Colors.black,),)),
SizedBox(height:30,),
 

                   OutlinedButton(onPressed: ()async{
                    launch('tel://$number');
                     }, 
                    child: Text("DIRECT CALL"),
                   
                   ),

                   OutlinedButton(onPressed: (){}, child: Text("REQUEST APPOINTMENT"),
                   
                   )
                   ],
                   )),
                ),

             
               Divider(
                thickness:2,
                color: Colors.white
                ,),
             
                
        
             
             
              ],),
        
          ),
        ),


      
    );
  }
}