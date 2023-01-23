import 'package:buuilderapp/bloc/usercomment_bloc.dart';
import 'package:buuilderapp/widgets/circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  UsercommentBloc usercommentBloc = UsercommentBloc();

  @override
  void initState() {
    usercommentBloc.add(GetUserComment());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking")),
      body: BlocConsumer<UsercommentBloc, UsercommentState>(
        bloc:usercommentBloc,
        listener: (context, state) {
         if(state is UsercommentError){
          print(state.error);
         }
        },
        builder: (context, state) {
          if(state is UsercommentLoaded){
            return ListView.builder(
              itemCount: state.usercommentdata.length,
              itemBuilder: (context, index){
              return ListTile(
                title: Text(state.usercommentdata[index].title.toString()),
                subtitle: Text(state.usercommentdata[index].body.toString()),
              );
              
            });
          }  
         return CircularIndicator();
        },
      ),
    );
  }
}
