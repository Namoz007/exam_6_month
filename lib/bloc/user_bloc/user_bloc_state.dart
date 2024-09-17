import 'package:exam_6_month/data/models/my_model.dart';

sealed class UserBlocState{}

final class InitialUserBlocState extends UserBlocState{}

final class LoadingUserBlocState extends UserBlocState{}

final class LoadedUserUserBlocState extends UserBlocState{
  MyModel model;

  LoadedUserUserBlocState({required this.model});
}

final class ErrorUserBlocState extends UserBlocState{}