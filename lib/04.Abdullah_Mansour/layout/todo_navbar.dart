import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_courses/04.Abdullah_Mansour/shared/components/components.dart';
import 'package:flutter_courses/04.Abdullah_Mansour/shared/cubit/todo_cubit/todo_cubit.dart';
import 'package:flutter_courses/04.Abdullah_Mansour/shared/cubit/todo_cubit/todo_states.dart';

class TodoNavbar extends StatelessWidget {
  const TodoNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController timeController = TextEditingController();
    final TextEditingController dateController = TextEditingController();

    return BlocProvider<ToDoCubit>(
      create: (context) => ToDoCubit(),
      child: BlocConsumer<ToDoCubit, ToDoStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          key: scaffoldKey,
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
            onPressed: () {
              scaffoldKey.currentState!.showBottomSheet((context) => Container(
                    color: Colors.grey[200],
                    child: buildBottomSheetUi(
                      titleController: timeController,
                      timeController: timeController,
                      dateController: dateController,
                      context: context,
                    ),
                  ));
            },
            child: const Icon(Icons.add),
          ),
          body: ToDoCubit.get(context)
              .screens[ToDoCubit.get(context).currentIndex],
        ),
      ),
    );
  }

  Widget buildBottomSheetUi(
          {required TextEditingController titleController,
          required TextEditingController timeController,
          required TextEditingController dateController,
          required BuildContext context}) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: titleController,
              labelText: "Task Title",
              prefixIcon: const Icon(Icons.title),
            ),
            const SizedBox(height: 12),
            CustomTextField(
              controller: titleController,
              labelText: "Time Title",
              prefixIcon: const Icon(Icons.lock_clock),
              onTap: () {
                showTimePicker(context: context, initialTime: TimeOfDay.now());
              },
            ),
            const SizedBox(height: 12),
            CustomTextField(
              controller: titleController,
              labelText: "Date Title",
              prefixIcon: const Icon(Icons.date_range),
              onTap: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2024));
              },
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
}
