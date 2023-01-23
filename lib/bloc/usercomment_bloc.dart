import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:buuilderapp/global_constants.dart';
import 'package:buuilderapp/models/jsonplaceholder_model.dart';
import 'package:buuilderapp/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'usercomment_event.dart';
part 'usercomment_state.dart';

class UsercommentBloc extends Bloc<UsercommentEvent, UsercommentState> {
  UsercommentBloc() : super(UsercommentInitial()) {
    on<UsercommentEvent>((event, emit)async {
     if(event is GetUserComment){
      emit(UsercommentLoading());
      ApiServices apiServices= ApiServices();

      final Response response = await apiServices.getMethod(apiurl);

      if (response.statusCode == 200){
        List<dynamic> listdata= response.data;
        List<UserComment> userCommentList=[];
        for(var i=0; i< listdata.length; i++){
          Map<String,dynamic> singleitem= listdata[i] as Map<String,dynamic>;
          UserComment userComment = UserComment.formMap(singleitem);
          userCommentList.add(userComment);
        }
        emit(UsercommentLoaded(usercommentdata: userCommentList));
      }else{
        emit(UsercommentError(error:  response.data.toString()));
      }
     }
    });
  }
}
