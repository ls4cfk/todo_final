import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/data/models/todo_model.dart';
import 'package:todo/providers/todo_provider.dart';
import 'package:todo/widgets/todo_add_widget.dart';
import 'package:todo/widgets/todo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Todo> todoList = context.watch<TodoProvider>().todoList;

    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 250,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 30,
          title: const Text(
            "TODO APP",
            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6), fontSize: 30),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const AddTodoWidget();
                      });
                },
                icon: const Icon(Icons.add_circle),
                color: const Color.fromRGBO(108, 180, 177, 1),
                iconSize: 50,
              ),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(108, 180, 177, 1)),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TodoItem(
                id: todoList[index].id,
                name: todoList[index].name,
                description: todoList[index].description,
                isDone: todoList[index].isDone,
              );
            },
            key: UniqueKey(),
            itemCount: context.watch<TodoProvider>().todoList.length,
          ),
        ));
  }
}
