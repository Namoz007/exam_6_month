sealed class ScreenBlocState{}

final class LoadedScreenScreenBlocState extends ScreenBlocState{
  int index;

  LoadedScreenScreenBlocState({required this.index});
}