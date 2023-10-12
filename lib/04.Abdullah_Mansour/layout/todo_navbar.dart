import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_courses/04.Abdullah_Mansour/shared/cubit/todo_cubit/todo_cubit.dart';
import 'package:flutter_courses/04.Abdullah_Mansour/shared/cubit/todo_cubit/todo_states.dart';

class TodoNavbar extends StatelessWidget {
  const TodoNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ToDoCubit>(
      create: (context) => ToDoCubit(),
      child: BlocConsumer<ToDoCubit, ToDoStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(
              // BlocProvider.of<ToDoCubit>(context).currentIndex.toString()
              ToDoCubit.get(context)
                  .titles[ToDoCubit.get(context).currentIndex],
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: ToDoCubit.get(context).currentIndex,
            onTap: (value) => ToDoCubit.get(context).changeNavBar(value),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasks"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done), label: "Complete"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.archive), label: "Archived"),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          body: ToDoCubit.get(context)
              .screens[ToDoCubit.get(context).currentIndex],
        ),
      ),
    );
  }
}
