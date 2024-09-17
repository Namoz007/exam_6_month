import 'package:exam_6_month/bloc/user_bloc/user_bloc_event.dart';
import 'package:exam_6_month/bloc/user_bloc/user_bloc_state.dart';
import 'package:exam_6_month/core/app_details.dart';
import 'package:exam_6_month/data/models/my_model.dart';
import 'package:exam_6_month/data/repositories/user_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserBlocEvent,UserBlocState>{
  final UserRepositories _repositories;
  UserBloc({required UserRepositories repo}) : _repositories = repo, super(InitialUserBlocState()){
    on<GetMyUserUserBlocEvent>(_getMyUser);
    on<InputUserDetailsUserBlocEvent>(_inputUserDetails);
    on<DeleteMyUserBlocEvent>(_deleteUser);
    on<EditUserBlocEvent>(_editUser);
  }

  void _editUser(EditUserBlocEvent event,emit) async{
    emit(LoadingUserBlocState());
    await _repositories.editUser(event.model);
    print("bu user ${AppDetails.model!.totalSalary}");
    emit(LoadedUserUserBlocState(model: AppDetails.model!));
  }

  void _deleteUser(DeleteMyUserBlocEvent event,emit) async{
    emit(LoadingUserBlocState());
    await _repositories.deleteUser();
  }

  void _inputUserDetails(InputUserDetailsUserBlocEvent event,emit) async{
    emit(LoadingUserBlocState());
    await _repositories.inputUserDetails(event.model);
    emit(LoadedUserUserBlocState(model: AppDetails.model!));

  }

  void _getMyUser(GetMyUserUserBlocEvent event,emit) async{
    emit(LoadingUserBlocState());
    await _repositories.getMyUser();
    if(AppDetails.model == null){
      await _repositories.inputUserDetails(MyModel(totalSalary: 0.0, totalExpense: 0.0, totalIncome: 0.0));
    }
    emit(LoadedUserUserBlocState(model: AppDetails.model!));
  }
}