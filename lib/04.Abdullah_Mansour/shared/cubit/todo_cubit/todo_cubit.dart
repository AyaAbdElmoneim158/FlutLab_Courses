import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_courses/04.Abdullah_Mansour/modules/tasks/tasks_screen.dart';
import 'todo_states.dart';

class ToDoCubit extends Cubit<ToDoStates> {
  ToDoCubit() : super(AppInitState());
  static ToDoCubit get(context) => BlocProvider.of(context);

  //* Change_NavBar_logic ------------------------------------------------------
  int currentIndex = 0;
  List<Widget> screens = const [
    TasksScreen(),
    Center(child: Text("Done Screen")),
    Center(child: Text("Archived Screen")),
  ];
  List<String> titles = ["Tasks", "Done", "Archived"];
  void changeNavBar(val) {
    currentIndex = val;
    emit(AppChangeNavBarState());
  }
}
