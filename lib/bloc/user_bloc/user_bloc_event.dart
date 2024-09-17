import 'package:exam_6_month/data/models/my_model.dart';

sealed class UserBlocEvent{}


final class GetMyUserUserBlocEvent extends UserBlocEvent{}

final class InputUserDetailsUserBlocEvent extends UserBlocEvent{
  MyModel model;

  InputUserDetailsUserBlocEvent({required this.model,});
}

final class DeleteMyUserBlocEvent extends UserBlocEvent{}

final class EditUserBlocEvent extends UserBlocEvent{
  MyModel model;

  EditUserBlocEvent({required this.model});
}