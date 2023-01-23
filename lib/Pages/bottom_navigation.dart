import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final ValueNotifier<int> pageIndex;
  const BottomNavigation({ Key? key, required this.pageIndex }) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.pageIndex,
      builder: (context,value, child) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  
                    icon: Icon(Icons.home),
                    label: ("Home")
                ),
    
                const BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_outline),
                    label: ("Booking"),
                     ),
    
                     const BottomNavigationBarItem(
                    icon: Icon(Icons.phone),
                    label: ("Contact"),
                     ),
    
                new BottomNavigationBarItem(
                    icon: const Icon(Icons.info_outline),
                    label:("About Us")
                )
              ],
        
            currentIndex: widget.pageIndex.value,
            onTap: (index){
              widget.pageIndex.value=index;
            },
            
            selectedItemColor:Colors.blue,
    
            );
      }
    );
  }
}