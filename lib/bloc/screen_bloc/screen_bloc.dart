import 'package:bloc/bloc.dart';
import 'package:exam_6_month/bloc/screen_bloc/screen_bloc_state.dart';

class ScreenBloc extends Cubit<ScreenBlocState>{
  ScreenBloc() : super(LoadedScreenScreenBlocState(index: 0));

  void newScreen(int index){
    emit(LoadedScreenScreenBlocState(index: index));
  }
}