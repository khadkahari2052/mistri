part of 'usercomment_bloc.dart';

@immutable
abstract class UsercommentState {}

class UsercommentInitial extends UsercommentState {}

class UsercommentLoading extends UsercommentState{}

class UsercommentLoaded extends UsercommentState{
  final List<UserComment> usercommentdata;

  UsercommentLoaded({required this.usercommentdata});
}

class UsercommentError extends UsercommentState{
  final String error;

  UsercommentError({required this.error});
}

