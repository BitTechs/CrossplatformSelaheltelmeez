import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/src/bloc/student/classes/class_search_states.dart';

class ClassSearchCubit extends Cubit<ClassSearchStates> {
  ClassSearchCubit() : super(ClassSearchInitialState());

  static ClassSearchCubit get(context) => BlocProvider.of(context);

  int selectedTab = 1;

  void changeSelectedTab(int index)
  {
    selectedTab = index;
    emit(ClassSearchChangeInputState());
  }
}